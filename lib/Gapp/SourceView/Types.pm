package Gapp::SourceView::Types;

use MooseX::Types -declare => [qw(
GappSourceLanguage
Gtk2SourceLanguage
)];

use MooseX::Types::Moose qw( Any Str Undef );

class_type GappSourceLanguage,
    { class => 'Gapp::SourceLanguage' };
    
class_type Gtk2SourceLanguage,
    { class => 'Gtk2::SourceLanguage' };


1;
