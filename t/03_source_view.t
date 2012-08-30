#!/usr/bin/perl -w
use strict;

use Test::More tests => 3;


use Gapp;
use Gapp::SourceView;


{  # widget construction
    my $w = Gapp::SourceView->new;
    isa_ok $w, q[Gapp::SourceView];
    isa_ok $w->gobject, q[Gtk2::SourceView2::View];
}

{  # with buffer/language
   my $w =  Gapp::SourceView->new( buffer => Gapp::SourceBuffer->new( language => 'perl' ) );
   ok $w, q[create source-view with buff/language];
}





