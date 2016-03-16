#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Mojo::Pg;
use Text::xSV;

STDOUT->autoflush(1);

my $db_name = shift;
my $csv_file = shift;
say " Connecting to DB $db_name...";
my $pg = Mojo::Pg->new("postgresql:///$db_name");

say " Setting up spells...";

say "  Creating spells table...";
$pg->db->query(<<"SPELLS");
CREATE TABLE spells (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL,
  school text,
  subschool text,
  descriptor text,
  acid boolean DEFAULT 'f',
  air boolean DEFAULT 'f',
  chaotic boolean DEFAULT 'f',
  cold boolean DEFAULT 'f',
  curse boolean DEFAULT 'f',
  darkness boolean DEFAULT 'f',
  death boolean DEFAULT 'f',
  disease boolean DEFAULT 'f',
  earth boolean DEFAULT 'f',
  electircity boolean DEFAULT 'f',
  emotion boolean DEFAULT 'f',
  evil boolean DEFAULT 'f',
  fear boolean DEFAULT 'f',
  fire boolean DEFAULT 'f',
  force boolean DEFAULT 'f',
  good boolean DEFAULT 'f',
  language_dependent boolean DEFAULT 'f',
  lawful boolean DEFAULT 'f',
  light boolean DEFAULT 'f',
  mind_affecting boolean DEFAULT 'f',
  pain boolean DEFAULT 'f',
  poison boolean DEFAULT 'f',
  shadow boolean DEFAULT 'f',
  sonic boolean DEFAULT 'f',
  water boolean DEFAULT 'f',
  casting_time text,
  components text,
  costly_components text,
  range text,
  area text,
  effect text,
  targets text,
  duration text,
  dismissible boolean DEFAULT 'f',
  shapeable boolean DEFAULT 'f',
  saving_throw text,
  spell_resistence text,
  material_costs text,
  verbal boolean DEFAULT 'f',
  somatic boolean DEFAULT 'f',
  material boolean DEFAULT 'f',
  focus boolean DEFAULT 'f',
  divine_focus boolean DEFAULT 'f',
  deity text,
  domain text,
  bloodline text,
  patron text,
  description text NOT NULL,
  short_description text NOT NULL,
  mythic boolean DEFAULT 'f',
  mythic_text text,
  augmented text,
  source text,
  SLA_Level integer
);
SPELLS

say "  Create table spells_rel_class";
$pg->db->query(<<"SPELLS_REL_CLASS");
CREATE TABLE spells_rel_class (
	spell serial NOT NULL REFERENCES spells(id),
	class text NOT NULL,
	level integer NOT NULL,
	UNIQUE (spell, class)
);
SPELLS_REL_CLASS

say "  Inserting values from $csv_file...";
my $csv = Text::xSV->new();
$csv->open_file($csv_file);
$csv->read_header();

my $count = 0;
while (defined (my $row = $csv->fetchrow_hash())) {
	if ($count++ % 50 == 0) { print $count % 250 ? "." : " "; }
	my $id = add_spell($row);
	add_spell_class($id, $row);
}

say " Done.";

sub add_spell {
	my $row = shift;
	foreach my $val (values %$row) { $val = undef if defined $val and $val eq 'NULL'; }
	my @fields = qw/ name school subschool descriptor acid air chaotic cold curse darkness death disease earth electricity emotion evil fear fire force good language_dependent lawful light mind_affecting pain poison shadow sonic water casting_time components costly_components ranger area effect targets duration dismissible shapeable saving_throw spell_resistance material_costs verbal somatic material focus divine_focus deity domain bloodline patron description short_description mythic mythic_text augmented SLA_Level source /;
	my $fields = join ", ", @fields;
	my $values = join ", ", ('?')x@fields;
	my $query = <<"ADD_SPELL";
INSERT INTO spells ($fields) VALUES ($values) RETURNING id;
ADD_SPELL
	$pg->db->query($query, @{ $row }{@fields})->hash()->{id};
}

sub add_spell_class {
	my ($sid, $row) = @_;
	my %classes = get_classes_from_row($row);

	foreach my $class (keys %classes) {
		$pg->db->query('INSERT INTO spells_rel_class (spell, class, level) VALUES (?, ?, ?);', $sid, $class, $classes{$class});
	}
}

sub get_classes_from_row {
	my ($row) = @_;
	my %classes;
	$classes{sorcerer} = $row->{sor} if defined $row->{sor};
	$classes{wizard} = $row->{wiz} if defined $row->{wiz};

	for my $class (qw/ cleric druid ranger bard paladin alchemist summoner witch inquisitor oracle antipaladin magus adept bloodrager shaman psychic medium mesmerist occultist spiritualist skald /) {
		$classes{$class} = $row->{$class} if defined $row->{$class};
	}
	return %classes;
}
