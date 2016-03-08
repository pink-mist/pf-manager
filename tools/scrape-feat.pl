#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use open qw( :encoding(UTF-8) :std );

use Mojo::Util qw/ slurp spurt encode decode /;
use Mojo::UserAgent;
use Try::Tiny;
use Text::Fuzzy;
use List::UtilsBy qw/ nsort_by uniq_by /;
use Getopt::Long;

sub indent {
	my ($indent, $text) = @_;
	return $text unless $indent;

	my @lines = split /\n/, $text;
	foreach my $line (@lines) {
		next unless length($line);
		$line = (" " x $indent) . $line;
	}
	return join "\n", @lines;
}

sub width {
	my ($width, $text) = @_;
	return $text unless $width;

	my @lines = split /\n/, $text;
	my @result;
	foreach my $line (@lines) {
		while (length($line) > $width) {
			push @result, substr $line, 0, $width, '';
		}
		push @result, $line;
	}
	return join "\n", @result;
}

sub show_usage {
	say <<"END";
$0 [options] feat
$0 -h

Options:
  -h|--help    Show this help
  -l|--list    Only list matching feats
  -o|--one     Only display the first match
  -r|--raw     Don't format the output
END
	return 1;
}

sub filter {
	my $dom = shift;
	$dom->find(':not(a,b)')->map('strip');
	return $dom->content();
}

foreach my $ARG (@ARGV) { $ARG = decode('UTF-8', $ARG); }

my $opts = {};
GetOptions($opts, 'one|o', 'list|l', 'raw|r', 'help|h');

show_usage and exit if $opts->{help};

my $ua = Mojo::UserAgent->new();
my $feat = shift // '';

exit unless length $feat;

my $cache = try {
	decode 'UTF-8', slurp('feats.html');
} catch {
	chomp(my $url = slurp('url.conf'));
	warn "Getting $url...\n";
	my $body = $ua->get($url)->res->body();
	spurt(encode('UTF-8', $body), 'feats.html');
	$body;
};

my $dom = Mojo::DOM->new($cache);

my $links = $dom->find('div > div > a')->grep(sub { defined( $_->attr('href') ) and $_->attr('href') =~ m!pathfinderogc/feats/.+/.+!; });

my $fuzz = Text::Fuzzy->new($feat);
my @results =
    nsort_by { $fuzz->distance( $_->text() =~ s/ \([^()]+\)$//r ) }
    grep {
		$fuzz->distance( $_->text() =~ s/ \([^()]+\)$//r ) <= length($feat)/2
			or
		index($_->text(), $feat) != -1
	}
	uniq_by { $_->attr('href') }
    @{ $links };

my ($indent, $width) = (2, 76);
if ($opts->{raw}) { ($indent, $width) = (0, 0); }
my $scrapes = 0;
foreach my $result (@results) {
	say width $width, $result->text;
	next if $opts->{list};

	my ($page) = $result->attr('href') =~ m!/([^/]+)$!;
	my $desc = try {
		decode 'UTF-8', slurp("feats/$page");
	} catch {
		if ( $scrapes++ > 3 ) { warn "Scraping too many pages at once."; return ''; }
		warn "Getting ", $result->attr('href'), "...\n";
		my $res = $ua->get($result->attr('href'))->res();
		warn "Error getting page\n" and return '' if ((not defined $res->code()) or $res->code() != 200);
		my ($div) = @{ $res->dom('div.sites-layout-name-two-column-hf.sites-layout-vbox') };
		warn $res->body() and return '' unless defined $div;
		my @elements = @{ $div->find('i, p')->map(sub { filter($_) }); };
		my $body = join "\n\n", uniq_by { $_ } grep { length } @elements;
		spurt(encode('UTF-8', $body), "feats/$page");
		$body;
	};
	if (not $opts->{raw}) { $desc = join "\n\n", map { Mojo::DOM->new($_)->all_text() } split /\n\n/, $desc; }

	say indent $indent, width $width, $desc;
	say '';
} continue {
	last if $opts->{one};
}

exit;
