#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use Test::More;

use lib "$FindBin::Bin/../../../../lib/";

use OneTool::Web::Wiki::Admin;
use Dancer::Test;

my @routes_get = ('/wiki/admin/servers');

foreach my $route (@routes_get)
{
    route_exists [GET => $route], 
        "a route handler is defined for $route";
    response_status_is [GET => $route], 200, 
        "response status is 200 for $route";
}

done_testing(scalar @routes_get * 2);