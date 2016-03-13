#!/bin/bash

DB="pathfinder"
echo "Creating DB: $DB"
createdb $DB

echo "Setting up tables..."
DIR=$( dirname $0 )
$DIR/setup-tables.pl $DB $1

echo "Done."
