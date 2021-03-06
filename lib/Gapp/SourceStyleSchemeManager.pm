package Gapp::SourceStyleSchemeManager;


use Moose;
use MooseX::SemiAffordanceAccessor;
extends 'Gapp::Object';

use MooseX::Types::Moose qw( Str Undef );

use Gtk2::SourceView2;

has '+gclass' => (
    default => 'Gtk2::SourceView2::StyleSchemeManager',
);

has 'default' => (
    is => 'rw',
    isa => 'Bool',
    default => 0,
);

has '+gobject' => (
     handles => [qw( get_scheme )],
);


sub BUILDARGS {
    my $class = shift;
    my %args = @_ == 1 && is_HashRef( $_[0] ) ? %{$_[0]} : @_;
    
    for ( qw[search_path] ) {
        $args{properties}{$_} = delete $args{$_} if exists $args{$_}; 
    }
   
    __PACKAGE__->SUPER::BUILDARGS( %args );
}


before '_construct_gobject' => sub {
    my ( $self ) = @_;
    if ( $self->default ) {
        $self->set_constructor( 'get_default' );
    }
};


1;



__END__

=pod

=head1 NAME

Gapp::SourceStyleSchemeManager - SourceStyleSchemeManager object

=head1 OBJECT HIERARCHY

=over 4

=item L<Gapp::Object>

=item +-- Gapp::SourceStyleSchemeManager

=back

=head1 DELEGATES TO GTK

=head2 Attributes

=over 4

=item B<search_path>

=back

=head1 PROVIDED ATTRIBUTES

=over 4

=item B<default>

=over 4

=item isa Bool

=item default 0

If set to 1, this gobject will be constructed from Gtk2::SourceStyleSchemeManager::get_default instead of
Gtk2::SourceStyleSchemeManager::new.

=back

=back

=head1 AUTHORS

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT & LICENSE

This software Copyright (c) 2010-2012 Jeffrey Ray Hallock.

This is free software, licensed under:

   The Artistic License 2.0 (GPL Compatible)

=cut
