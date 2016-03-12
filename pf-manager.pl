#!/usr/bin/env perl
use FindBin '$RealBin';
use lib "$RealBin/tools";

use Util::Scrape::Feat;
use Util::Text qw/ indent /;
use Mojolicious::Lite;
use Mojo::IOLoop;
use Mojo::Pg;

my $pg = Mojo::Pg->new('postgresql:///pathfinder');
my $scraper = Util::Scrape::Feat->new(root => "$RealBin/tools", pg => $pg);

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

get '/feats/:feat' => sub { shift->loadfeat()->render(template => 'feat'); };
any '/feats' => sub { shift->render(template => 'feats'); };

helper loadfeat => sub {
	my $c = shift;
	$c->stash(feat => $c->param('feat'));
	return $c;
};

helper get_feat_list => sub {
	my ($c, $search, $type) = @_;
	my ($sorted, @results) = $scraper->find($search, $type);
	$c->stash(sorted => $sorted);
	my $last = '';
	my @jumps;
	my @feats = map {
			my $types = join ", ", grep defined, @{ $_->{types} };
			my $name = $_->{name};
			$name .= " ($types)" if length $types;
			my $url = sprintf "/feats/%s", $_->{name};
			my @return = { name => $name, url => $url };

			if ($sorted) {
				my $cur = substr $name, 0, 1;
				if ($cur ne $last) {
					$last = $cur;
					push @jumps, $cur;
					unshift @return, { jump => $cur };
				}
			}
			@return;
		}
		@results;
	return {jumps => \@jumps, list => \@feats};
};

helper get_feat => sub {
	my ($c, $feat) = @_;
	my $desc = $scraper->get_feat($feat);
	$desc =~ s!\n\n!<p>!g;
	$desc =~ s!\n!<br>!g;
	$desc =~ s!(<br>|<p>)!$1\n!g;

	return indent 6, $desc;
};

helper get_feat_type_list => sub {
	my ($c) = @_;

	my @types = ({ name => 'Remove Filter', url => '/feats' }, map { +{ name => $_, url => Mojo::URL->new('/feats')->query(type => $_)->to_string } }
		@{ $pg->db->query('SELECT name FROM feat_types ORDER BY name;')->hashes()->map(sub { $_->{name} }) });
	return { jumps => [], list => \@types };
};

helper render_list => sub {
	my $c = shift;
	my $cb = shift;

	my $spec = $c->$cb(@_);

	my @jumps = @{ $spec->{jumps} };
	my $jump_html = '';
	if (@jumps) {
		$jump_html .= '<a name="jump">Jump to</a>: ' . join " | ", map { sprintf '<a href="#%1$s">%1$s</a>', $_; } @jumps;
	}

	my @list = @{ $spec->{list} };
	my $list_html = '';
	foreach my $item (@list) {
		if (exists $item->{jump}) {
			if (length $list_html) { $list_html .= '</ul>'; }
			$list_html .= sprintf '<h3 class="jump"><a name="%1$s">%1$s</a></h3><a href="#jump" class="jump">^Top</a>', $item->{jump};
			$list_html .= '<ul>';
		} else {
			if (not length $list_html) { $list_html .= '<ul>'; }
			$list_html .= sprintf '<li><a href="%s">%s</a>', $item->{url}, $item->{name};
		}
	}
	if (length $list_html) { $list_html .= '</ul>'; }

	my $html = '';
	if (length $jump_html) { $html .= sprintf '<div class="jump">%s</div>', $jump_html; }
	if (length $list_html) { $html .= sprintf '<div class="list">%s</div>', $list_html; }

	return $html;
};

# Decrese scrape counter every 5 seconds
Mojo::IOLoop->recurring(5 => sub { my $scrapes = $scraper->scrapes(); $scrapes-- if $scrapes; $scraper->scrapes($scrapes); });

app->secrets(['foo']);
app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'pf-manager';
<h1>Games</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
