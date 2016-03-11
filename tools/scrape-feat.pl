#!/usr/bin/env perl

use strict;
use warnings;
use Mojo::Util qw/ decode /;
use Getopt::Long;

use FindBin '$RealBin';
use lib $RealBin;
use Util::Scrape::Feat;

unless (caller()) {
	foreach my $ARG (@ARGV) { $ARG = decode('UTF-8', $ARG); }

	my $opts = {};                      # rawr~~
	GetOptions($opts, 'one|o', 'list|l', 'raw|r', 'help|h', 'make');

	my $scraper = Util::Scrape::Feat->new();
	$scraper->show_usage() and exit if $opts->{help};

	$scraper->make() and exit if $opts->{make};

	$scraper->main($opts, @ARGV);
}
