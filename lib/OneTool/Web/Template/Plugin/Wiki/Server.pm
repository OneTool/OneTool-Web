=head1 NAME

OneTool::Web::Template::Plugin::Wiki::Server

=cut

package OneTool::Web::Template::Plugin::Wiki::Server;

use strict;
use warnings;

use FindBin;

use base 'Template::Plugin';

use lib "$FindBin::Bin/../lib/";

use OneTool::Configuration;

=head1 SUBROUTINES/METHODS

=head2 new()

=cut

sub new
{
    my ($class, $context, $params) = @_;

    bless {
        _CONTEXT => $context,
    }, $class;
}

=head2 Configurations($sort)

Returns OneTool Wiki Servers Configurations

=cut

sub Configurations
{
    my ($self, $sort) = @_;

    my $conf = OneTool::Configuration::Get({ file => "$FindBin::Bin/../conf/itt_web_wiki.conf" });

    return ($conf);
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut