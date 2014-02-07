=head1 NAME

OneTool::Web::Wiki - OneTool Web Wiki module

=cut

package OneTool::Web::Wiki;

use strict;
use warnings;

use Dancer ':syntax';
use Template;
use Text::Markdown 'markdown';

use lib "$FindBin::Bin/../lib/";

use OneTool::Wiki::Server::Page;

my $TT = Template->new({ PLUGIN_BASE => 'OneTool::Web::Template::Plugin' });

=head1 DANCER ROUTES

=head2 GET /wiki/page/edit/:page

Edits Wiki Page ':page'

=cut

get '/wiki/page/edit/:page' => sub
{
    my $page = params->{'page'};
    
    my $text = OneTool::Wiki::Server::Page::Load($page);
    #my $html = $text; #markdown($text);

    template 'wiki/page_edit.tt',
        {
            page_title => 'OneTool Wiki',
            page => $page,
            text => $text,
        };
};

=head2 POST /wiki/page/save/:page

Saves Wiki Page ':page'

=cut

post '/wiki/page/save' => sub
{
    my ($page, $text, $tags) = (params->{'page'}, params->{'text'}, params->{'tags'});

    my $result = OneTool::Wiki::Server::Page::Save($page, $text, $tags);

    redirect "wiki/page/show/$page";
};

=head2 GET /wiki/page/show/:page

Shows Wiki Page ':page'

=cut

get '/wiki/page/show/:page' => sub
{
    my $page = params->{'page'};
    my $params = params;
    
    my $text = OneTool::Wiki::Server::Page::Load($page);
    my $html;
    $TT->process(\$text, $params, \$html);
    my $html = markdown($html);

    template 'wiki/page_show.tt',
        {
            page_title => 'OneTool Wiki',
            page => $page,
            html => $html,
        };
};

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut