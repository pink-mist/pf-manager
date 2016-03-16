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

sub in {
	my ($first, @rest) = @_;
	foreach my $test (@rest) { return 1 if $first eq $test }
	return 0
}

while (defined(my $row = $csv->fetchrow_hash())) {
	next if index($row->{name}, $search) == -1 and $fuzz->distance($row->{name}) > $cutoff;

	foreach my $key (
		qw/ name school subschool descriptor spell_level

		acid air chaotic cold curse darkness death disease earth electircity emotion evil fear fire force good
		language_dependent lawful light mind_affecting pain poison shadow sonic water

		sor wiz cleric druid ranger bard paladin alchemist summoner witch inquisitor oracle antipaladin magus adept bloodrager shaman psychic medium mesmerist occultist spiritualist skald
		casting_time components costly_components range area effect targets duration dismissible shapeable saving_throw spell_resistence material_costs
		verbal somatic material focus divine_focus deity domain bloodline patron
		description description_formated short_description
		mythic_text augmented mythic
		SLA_Level
		source linktext /
		) {
		next if not defined $row->{$key};
		next if $row->{$key} eq 'NULL';
		next if $row->{$key} eq '0' and in($key, qw/ acid air chaotic cold curse darkness death disease earth electircity emotion evil fear fire force good language_dependent lawful light mind_affecting pain poison shadow sonic water /);
		printf "%s: %s\n", $key, $row->{$key};
	}
	print "\n";
}
