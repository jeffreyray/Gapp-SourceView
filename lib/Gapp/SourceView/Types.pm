package Gapp::SourceView::Types;

use MooseX::Types -declare => [qw(
GappSourceLanguage
Gtk2SourceLanguage
GappStyleScheme
Gtk2StyleScheme
)];

use MooseX::Types::Moose qw( Any Str Undef );

class_type GappSourceLanguage,
    { class => 'Gapp::SourceLanguage' };
    
class_type Gtk2SourceLanguage,
    { class => 'Gtk2::SourceView2::Language' };

class_type GappStyleScheme,
    { class => 'Gapp::SourceStyleScheme' };
    
class_type Gtk2StyleScheme,
    { class => 'Gtk2::SourceView2::StyleScheme' };


1;
