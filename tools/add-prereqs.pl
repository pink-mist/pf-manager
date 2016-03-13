#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Mojo::Pg;
use Text::xSV;

my $db_name = shift;
my $csv_file = shift;
say " Connecting to DB $db_name...";
my $pg = Mojo::Pg->new("postgresql:///$db_name");

say " Opening CSV: $csv_file...";
my $csv = Text::xSV->new();
$csv->open_file($csv_file);
$csv->read_header();

while (defined (my $row = $csv->fetchrow_hash())) {
	add_prereq_feats($row);
}

say "  Done.";

sub add_prereq_feats {
	my ($row) = @_;
	my $feats = $row->{prerequisite_feats};
	return unless defined $feats;

	my $current = get_feat_id($row);

	say sprintf "Adding prereqs for    '%s'    from: %s", $row->{name}, $row->{source};
	my @feats = split / ?(?:,|\|) ?/, $feats;
	my %uniq;
	foreach my $feat (@feats) {
		my $mythic = $feat =~ /\(mythic\)/i ? 'mythic' : 0;
		$feat =~ s/ \(.*$//;

		next if $uniq{"$feat$mythic"}++;

		my @ids = grep { $_ != $current } map { $_->{id} } @{ $pg->db->query('SELECT id FROM feats WHERE name = ?', $feat)->hashes() };
		if (@ids == 1) {
			$pg->db->query('INSERT INTO feats_rel_feats (feat, prerequisite_feat) VALUES (?, ?);', $current, $ids[0]);
			next;
		} else {
			my $id = prompt($feat, $mythic, $row->{source}, @ids);
			print "No valid id found.\n" if not defined $id;
			say "";
			$pg->db->query('INSERT INTO feats_rel_feats (feat, prerequisite_feat) VALUES (?, ?);', $current, $id) if defined $id;
		}
	}
}

sub get_feat_id {
	my ($row) = @_;

	my $res = $pg->db->query('SELECT id FROM feats WHERE name = ? AND source = ?', $row->{name}, $row->{source});
	return $res->hash()->{id} if $res->rows() == 1;

	die sprintf "Could not disambiguate '%s'.\n", $row->{name};
}

sub prompt {
	my ($feat, $mythic, $source, @ids) = @_;

	# If we didn't find any id, prompt for a better search string
	@ids = search_feats($feat) if not @ids;

	# First filter based on mythic or not
	my @myth_ids = map { $_->{id} } @{ $pg->db->query("SELECT id FROM feats WHERE id = ANY(?) AND source = 'Mythic Adventures';", sprintf('{%s}', join ",", @ids))->hashes() };
	if ($mythic) {
		@ids = grep { in($_, @myth_ids) } @ids;
	} else {
		@ids = grep { not in($_, @myth_ids) } @ids;
	}

	return $ids[0] if @ids == 1;
	return undef if not @ids;

	# Then filter based on being the same source or not
	my @sources = @{ $pg->db->query('SELECT id, source FROM feats WHERE id = ANY(?)', sprintf('{%s}', join ",", @ids))->hashes() };
	foreach my $src (@sources) {
		if ($src->{source} eq $source) { return $src->{id} }
	}

	# Lastly, prompt
	my $res = $pg->db->query('SELECT id, name, source FROM feats WHERE id = ANY(?)', sprintf("{%s}", join ",", @ids));
	printf "  ID    : %s\n  Name  : %s\n  Source: %s\n\n", @{ $_ }{'id', 'name', 'source'} for @{ $res->hashes() };
	print "Please select one: ";
	chomp(my $chosen = <STDIN>);

	return length $chosen ? $chosen : undef;
}

sub search_feats {
	printf "Could not find a feat named '%s'. Please enter a more correct term: ", shift;
	chomp(my $search = <STDIN>);

	return map { $_->{id} } @{ $pg->db->query('SELECT id FROM feats WHERE name = ?', $search)->hashes() };
}

sub in {
	my ($first, @rest) = @_;
	foreach my $rest (@rest) {
		return 1 if $first eq $rest;
	}
	return 0;
}
