#!/usr/bin/perl -w
use strict;

use Test::More tests => 2;


use Gapp;
use Gapp::SourceStyleSchemeManager;


{   # basic construction
    my $w = Gapp::SourceStyleSchemeManager->new;
    isa_ok $w, q[Gapp::SourceStyleSchemeManager];
    isa_ok $w->gobject, q[Gtk2::SourceView2::StyleSchemeManager];
}


