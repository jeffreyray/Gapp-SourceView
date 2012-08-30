#!/usr/bin/perl -w
use strict;

use Test::More tests => 3;


use Gapp;
use Gapp::SourceBuffer;


{   # basic construction
    my $w = Gapp::SourceBuffer->new;
    isa_ok $w, q[Gapp::SourceBuffer];
    isa_ok $w->gobject, q[Gtk2::SourceView2::Buffer];
}

{  # with language attribute
    my $w = Gapp::SourceBuffer->new( language => 'perl' );
    is $w->gobject->get_language->get_id, 'perl', 'language set from string';
}


