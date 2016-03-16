#!/bin/bash

DB="pathfinder"
echo "Creating DB: $DB"
createdb $DB

echo "Setting up tables..."
DIR=$( dirname $0 )
$DIR/setup-feats.pl $DB feats-${1}.csv
$DIR/setup-spells.pl $DB spells-${1}.csv

echo "Done."
