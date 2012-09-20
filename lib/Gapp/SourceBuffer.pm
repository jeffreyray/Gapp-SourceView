package Gapp::SourceBuffer;


use Moose;
use MooseX::SemiAffordanceAccessor;

use MooseX::Types::Moose qw( Str Undef );

extends 'Gapp::TextBuffer';

use Gtk2::SourceView2;
use Gapp::SourceView::Types qw( GappSourceLanguage Gtk2SourceLanguage GappStyleScheme Gtk2StyleScheme );

use Gapp::SourceLanguageManager;
use Gapp::SourceStyleSchemeManager;

has '+gclass' => (
    default => 'Gtk2::SourceView2::Buffer',
);

has 'language' => (
    is => 'rw',
    isa => Str|Undef|GappSourceLanguage|Gtk2SourceLanguage,
);

has 'language_manager' => (
    is => 'rw',
    isa => 'Gapp::SourceLanguageManager',
    default => sub { Gapp::SourceLanguageManager->new( default => 1) },
    lazy => 1,
);

has 'style_scheme' => (
    is => 'rw',
    isa => 'Maybe[Gapp::SourceStyleScheme]',
);

has 'style_scheme_manager' => (
    is => 'rw',
    isa => 'Gapp::SourceLanguageManager',
    default => sub { Gapp::SourceStyleSchemeManager->new( default => 1) },
    lazy => 1,
);


has 'undo_manager' => (
    is => 'rw',
    isa => 'Maybe[Gapp::SourceUndoManager]',
);



sub BUILDARGS {
    my $class = shift;
    my %args = @_ == 1 && is_HashRef( $_[0] ) ? %{$_[0]} : @_;
    
    for ( qw[can_redo can_undo highlight_matching_brackets highlight_syntax max_undo_levels] ) {
        $args{properties}{$_} = delete $args{$_} if exists $args{$_}; 
    }
    
    __PACKAGE__->SUPER::BUILDARGS( %args );
}

before '_construct_gobject' => sub {
    my ( $self ) = @_;
    $self->set_args( [ $self->tag_table ? $self->tag_table->gobject : undef ] );
};

after '_construct_gobject' => sub {
    my ( $self ) = @_;
    
    my $l; # language
    
    if ( ! is_Undef $self->language ) {
        if ( is_Str $self->language ) {
            $l = $self->language_manager->gobject->get_language( $self->language );
        }
        elsif ( is_Gtk2SourceLanguage $self->language ) {
            $l = $self->language;
        }
        elsif ( is_GappSourceLanguage $self->language ) {
            $l = $self->language->gobject;
        }
    }
    
    my $scheme;
    
    if ( ! is_Undef $self->style_scheme ) {
        if ( is_Str $self->style_scheme ) {
            $scheme = $self->style_scheme_manager->gobject->get_language( $self->language );
        }
        elsif ( is_Gtk2StyleScheme $self->style_scheme ) {
            $scheme = $self->style_scheme;
        }
        elsif ( is_GappStyleScheme $self->style_scheme ) {
            $scheme = $self->style_scheme->gobject;
        }
    }
    
    $self->gobject->set_language( $l ) if $l;
    $self->gobject->set_style_scheme( $scheme ) if $scheme;
};


1;




__END__

=pod

=head1 NAME

Gapp::SourceBuffer - SourceBuffer Widget

=head1 OBJECT HIERARCHY

=over 4

=item L<Gapp::Widget>

=item +-- L<Gapp::TextBuffer>

=item ----+-- L<Gapp::SourceBuffer>

=back

=head1 DELEGATES TO GTK

=head2 Attributes

=over 4

=item B<can_redo>

=item B<can_undo>

=item B<highlight_matching_brackets>

=item B<highlight_syntax>

=item B<max_undo_levels>

=back

=head1 PROVIDED ATTRIBUTES

=over 4

=item B<language>

=over 4

=item isa Undef|Str|Gtk2::SourceLanguage|Gapp:SourceLanguage

=item default Undef

If supplied, this value will be used as the source-language for the buffer. You may pass in
a string, which will use the B<language_manager> to find the language, a Gapp:SourceViewLanguage,
or a Gtk2::SourceView2::Language - the buffer will "do the right thing."

=back

=item B<language_manager>

=over 4

=item isa Gapp::SourceLanguageManager

=item lazy 1

This is the language manager to be used when finding a language definition. The default language
manager is an instance of Gtk2::SourceView2::LanguageManager::get_default encapsulated in a Gapp::LanguageManager
object.

=back

=item B<style_scheme>

=over 4

=item isa Undef|Str|Gtk2::SourceView2::StyleScheme|Gapp:SourceStyleScheme

=item default Undef

If supplied, this value will be used as the style scheme for the buffer. You may pass in
a string, which will use the B<style_scheme_manager> to find the language, a Gapp:SourceStyleScheme,
or a Gtk2::SourceView2::StyleScheme - the buffer will "do the right thing."

=back

=item B<style_scheme_manager>

=over 4

=item isa Gapp::StyleSchemeManager

=item lazy 1

This is the manager to be used when finding a style scheme. The default is an instance of Gtk2::SourceView2::StyleSchemeManager::get_default
encapsulated in a Gapp::SourceStyleSchemeManager object.

=back

=back


=head1 AUTHORS

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT & LICENSE

This software Copyright (c) 2010-2012 Jeffrey Ray Hallock.

This is free software, licensed under:

   The Artistic License 2.0 (GPL Compatible)

=cut

