#!/usr/bin/env perl

use strict;
use warnings;

use Text::xSV;
use Text::Fuzzy;

my $file = shift;
my $search = join " ", @ARGV;

my $csv = Text::xSV->new();

$csv->open_file($file);
$csv->read_header();

my $fuzz = Text::Fuzzy->new($search);
my $cutoff = int length($search)/2;

while (defined(my $row = $csv->fetchrow_hash())) {
	next if index($row->{name}, $search) == -1 and $fuzz->distance($row->{name}) > $cutoff;

	foreach my $key (
		qw/ name type description
		prerequisites prerequisite_feats prerequisite_skills race_name weapon_mastery item_mastery companion_familiar multiples
		benefit normal special goal completion_benefit note suggested_traits
		source /) {
		next if not defined $row->{$key};
		printf "%s: %s\n", $key, $row->{$key};
	}
	print "\n";
}
