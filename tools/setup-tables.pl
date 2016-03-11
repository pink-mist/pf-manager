#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Mojo::Pg;

my $db_name = shift;
say " Connecting to DB $db_name...";
my $pg = Mojo::Pg->new("postgresql:///$db_name");

say "  Creating feat_types table";
$pg->db->query(<<"FEAT_TYPES");
CREATE TABLE feat_types (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);
FEAT_TYPES

say "  Creating feats table";
$pg->db->query(<<"FEATS");
CREATE TABLE feats (
  id serial PRIMARY KEY,
  name text NOT NULL,
  description text,
  source text NOT NULL UNIQUE,
  updated date DEFAULT CURRENT_DATE
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

say "  Creating lists table";
$pg->db->query(<<"LISTS");
CREATE TABLE lists (
  name text PRIMARY KEY,
  content text NOT NULL,
  updated date DEFAULT CURRENT_DATE
);
LISTS
