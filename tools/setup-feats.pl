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

say " Setting up feats...";

say "  Creating feat_types table";
$pg->db->query(<<"FEAT_TYPES");
CREATE TABLE feat_types (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);
FEAT_TYPES
$pg->db->query('INSERT INTO feat_types (name) VALUES (?);', $_) for (qw/ Teamwork Critical Grit Style Performance Racial Panache Betrayal Targeting Esoteric Stare /);

say "  Creating skills table";
$pg->db->query(<<"SKILLS");
CREATE TABLE skills (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE,
  link text
);
SKILLS

say "  Creating races table";
$pg->db->query(<<"RACES");
CREATE TABLE races (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE,
  link text
);
RACES

say "  Creating feats table";
$pg->db->query(<<"FEATS");
CREATE TABLE feats (
  id serial PRIMARY KEY,
  updated date DEFAULT CURRENT_DATE,
  name text NOT NULL,
  description text,
  prerequisites text,
  weapon_mastery boolean DEFAULT 'f',
  item_mastery boolean DEFAULT 'f',
  companion_familiar boolean DEFAULT 'f',
  multiples boolean DEFAULT 'f',
  benefit text,
  normal text,
  special text,
  goal text,
  completion_benefit text,
  note text,
  suggested_traits text,
  source text
);
FEATS

say "  Creating feats_rel_feat_types table";
$pg->db->query(<<"FEATS_REL_FEAT_TYPES");
CREATE TABLE feats_rel_feat_types (
  feat serial NOT NULL REFERENCES feats(id),
  type serial NOT NULL REFERENCES feat_types(id),
  UNIQUE (feat, type)
);
FEATS_REL_FEAT_TYPES

say "  Creating feats_rel_skills table";
$pg->db->query(<<"FEATS_REL_SKILLS");
CREATE TABLE feats_rel_skills (
  feat serial NOT NULL REFERENCES feats(id),
  skill serial NOT NULL REFERENCES skills(id),
  UNIQUE (feat, skill)
);
FEATS_REL_SKILLS

say "  Creating feats_rel_races table";
$pg->db->query(<<"FEATS_REL_RACES");
CREATE TABLE feats_rel_races (
  feat serial NOT NULL REFERENCES feats(id),
  race serial NOT NULL REFERENCES races(id),
  UNIQUE (feat, race)
);
FEATS_REL_RACES

say "  Creating feats_rel_feats table";
$pg->db->query(<<"FEATS_REL_FEATS");
CREATE TABLE feats_rel_feats (
	feat serial NOT NULL REFERENCES feats(id),
	prerequisite_feat serial NOT NULL REFERENCES feats(id),
	UNIQUE (feat, prerequisite_feat),
	CONSTRAINT no_self_prereq CHECK (feat != prerequisite_feat)
);
FEATS_REL_FEATS

say "  Creating feats_with_types view";
$pg->db->query(<<"FEATS_WITH_TYPES");
CREATE VIEW feats_with_types AS (
  SELECT feats.id, feats.name, feats.source, array_agg(types.name ORDER BY types.name) AS types
  FROM feats
    LEFT JOIN feats_rel_feat_types AS rel ON feats.id = rel.feat
      LEFT JOIN feat_types AS types ON rel.type = types.id
  GROUP BY feats.id
);
FEATS_WITH_TYPES

say "  Creating feats_with_races view";
$pg->db->query(<<"FEATS_WITH_RACES");
CREATE VIEW feats_with_races AS (
  SELECT feats.id, array_agg(races.name ORDER BY races.name) AS races
  FROM feats
    LEFT JOIN feats_rel_races AS rel ON feats.id = rel.feat
      LEFT JOIN races ON rel.race = races.id
  GROUP BY feats.id
);
FEATS_WITH_RACES

say "  Creating feats_with_skills view";
$pg->db->query(<<"FEATS_WITH_SKILLS");
CREATE VIEW feats_with_skills AS (
  SELECT feats.id, array_agg(skills.name ORDER BY skills.name) AS skills
  FROM feats
    LEFT JOIN feats_rel_skills AS rel ON feats.id = rel.feat
      LEFT JOIN skills ON rel.skill = skills.id
  GROUP BY feats.id
);
FEATS_WITH_SKILLS

say "  Creating feats_with_feats view";
$pg->db->query(<<"FEATS_WITH_FEATS");
CREATE VIEW feats_with_feats AS (
  SELECT feats.id, array_agg(prereqs.name ORDER BY prereqs.name) AS feats
  FROM feats
    LEFT JOIN feats_rel_feats AS rel ON feats.id = rel.feat
      LEFT JOIN feats AS prereqs ON rel.prerequisite_feat = prereqs.id
  GROUP BY feats.id
);
FEATS_WITH_FEATS

say "  Inserting values from $csv_file...";
my $csv = Text::xSV->new();
$csv->open_file($csv_file);
$csv->read_header();

my $count = 0;
while (defined (my $row = $csv->fetchrow_hash())) {
	if ($count++ % 50 == 0) { print $count % 250 ? "." : " "; }
	my $id = add_feat($row);
	add_types($id, $row);
	add_skills($id, $row);
	add_races($id, $row);
}

say " Done.";

sub add_feat {
	my $row = shift;
	my @fields = qw/ name description prerequisites weapon_mastery item_mastery companion_familiar multiples benefit normal special goal completion_benefit note suggested_traits source /;
	my $fields = join ", ", @fields;
	my $values = join ", ", ('?')x@fields;
	my $query = <<"ADD_FEAT";
INSERT INTO feats ($fields) VALUES ($values) RETURNING id;
ADD_FEAT
	$pg->db->query($query, @{ $row }{@fields})->hash()->{id};
}

sub get_types_from_row {
	my $row = shift;
	my @types = split /, /, $row->{type};
	push @types, 'Teamwork' if $row->{teamwork};
	push @types, 'Critical' if $row->{critical};
	push @types, 'Grit' if $row->{grit};
	push @types, 'Style' if $row->{style};
	push @types, 'Performance' if $row->{performance};
	push @types, 'Racial' if $row->{racial};
	push @types, 'Panache' if $row->{panache};
	push @types, 'Betrayal' if $row->{betrayal};
	push @types, 'Targeting' if $row->{targeting};
	push @types, 'Esoteric' if $row->{esoteric};
	push @types, 'Stare' if $row->{stare};

	return @types;
}

sub add_types {
	my ($fid, $row) = @_;
	my @types = get_types_from_row($row);

	foreach my $type (@types) {
		my $tid = get_id('feat_types', $type, 'create');
		$pg->db->query('INSERT INTO feats_rel_feat_types (feat, type) VALUES (?, ?);', $fid, $tid);
	}
}

sub add_skills {
	my ($fid, $row) = @_;
	my @skills = split / ?(?:[,|]) ?/, $row->{prerequisite_skills} // '';

	my %uniq;
	foreach my $skill (@skills) {
		my ($name, $rank) = $skill =~ /^(.+) (\d+)$/;
		$name //= $skill;
		$name =~ s/\@//g; $name =~ s/\(.*//; $name =~ s/^\s+|\s+$//g;
		$name = lc($name);

		next if $uniq{$name}++;

		my $sid = get_id('skills', $name, 'create');
		$pg->db->query('INSERT INTO feats_rel_skills (feat, skill) VALUES (?, ?);', $fid, $sid);
	}
}

sub add_races {
	my ($fid, $row) = @_;
	return unless defined $row->{race_name};
	my $races = lc($row->{race_name});
	my @races = grep length, split / ?[,| ?]/, $races;

	my %uniq;
	foreach my $race (@races) {
		next if $uniq{$race}++;

		my $rid = get_id('races', "\u$race", 'create');
		$pg->db->query('INSERT INTO feats_rel_races (feat, race) VALUES (?, ?);', $fid, $rid);
	}
}

sub get_id {
	my ($table, $name, $create) = @_;
	my $res = $pg->db->query("SELECT id FROM $table WHERE name = ?", $name);

	return $res->hash()->{id} if $res->rows();
	return undef unless $create;

	$pg->db->query("INSERT INTO $table (name) VALUES (?) RETURNING id;", $name)->hash()->{id};
}

system('./add-prereqs.pl', $db_name, $csv_file);
