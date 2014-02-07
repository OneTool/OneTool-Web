#!/usr/bin/perl

use Dancer;
use FindBin;
use Template;

use lib "$FindBin::Bin/../lib";

set 'environement' => 'developement';

set 'layout'        => 'page';
set 'logger'        => 'console';
set 'template'      => 'template_toolkit';

my $template = Template->new({ 
    PLUGIN_BASE => 'OneTool::Web::Template::Plugin',
    });

use OneTool::Web::Wiki;
use OneTool::Web::Wiki::Admin;

dance;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut