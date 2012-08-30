#!/usr/bin/perl -w
use strict;

use Test::More tests => 2;


use Gapp;
use Gapp::SourceLanguageManager;


{   # basic construction
    my $w = Gapp::SourceLanguageManager->new;
    isa_ok $w, q[Gapp::SourceLanguageManager];
    isa_ok $w->gobject, q[Gtk2::SourceView2::LanguageManager];
}
