=head1 NAME

OneTool::Web::Wiki::Admin - OneTool Web Wiki Administration module

=cut

package OneTool::Web::Wiki::Admin;

use strict;
use warnings;

use Dancer ':syntax';

=head1 DANCER ROUTES

=head2 GET /wiki/admin/servers

Prints Wiki Servers Configuration

=cut

get '/wiki/admin/servers' => sub
{
    template 'wiki/admin/servers.tt',
        {
            page_title => 'OneTool Wiki Administration',
        };
};

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut