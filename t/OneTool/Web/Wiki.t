#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use Test::More;

use lib "$FindBin::Bin/../../../lib/";

use OneTool::Web::Wiki;
use Dancer::Test;

my @routes_get = ('/wiki/page/edit/:pagename', '/wiki/page/show/:pagename');
my @routes_post = ('/wiki/page/save');

foreach my $route (@routes_get)
{
    route_exists [GET => $route], 
        "a route handler is defined for $route";
    response_status_is [GET => $route], 200, 
        "response status is 200 for $route";
}

foreach my $route (@routes_post)
{
    route_exists [POST => $route], 
        "a route handler is defined for $route";
    #response_status_is [POST => $route], 200, 
    #    "response status is 200 for $route";
}

done_testing(scalar @routes_get * 2 + scalar @routes_post);