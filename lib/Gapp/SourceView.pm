package Gapp::SourceView;

our $VERSION = '0.02';

use Moose;
use MooseX::SemiAffordanceAccessor;
extends 'Gapp::TextView';

use Gtk2::SourceView2;
use Gapp::SourceBuffer;

use Gapp::SourceLanguageManager;
use Gapp::Moose::Meta::Attribute::Trait::GappSourceView;


has '+gclass' => (
    default => 'Gtk2::SourceView2::View',
);

has '+buffer' => (
    isa => 'Maybe[Gapp::SourceBuffer]',
);

1;



__END__

=pod

=head1 NAME

Gapp::SourceView - SourceView Widget

=head1 SYNOPSIS

    use Gapp;
    use Gapp::SourceView;
    
    my $s = Gapp::SourceView->new(
        buffer => Gapp::SourceBuffer->new( language => 'perl' );
    );
    
=head1 DESCRIPTION

This is a Gtk2::SourceView2 widget for use with the L<Gapp> framework.

=head1 OBJECT HIERARCHY

=over 4

=item L<Gapp::Widget>

=item +-- L<Gapp::TextView>

=item     +-- L<Gapp::SourceView>

=back

=head1 AUTHORS

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 SEE ALSO

=over 4

=item L<Gapp>

=item L<Gtk2>

=item L<Gtk2::SourceView2>

=back

=head1 COPYRIGHT & LICENSE

    Copyright (c) 2011-2012 Jeffrey Ray Hallock.

    This program is free software; you can redistribute it and/or
    modify it under the same terms as Perl itself.

=cut
