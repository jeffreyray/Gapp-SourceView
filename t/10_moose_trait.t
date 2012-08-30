#!/usr/bin/perl -w
use strict;

use Test::More tests => 1;


package Foo::Bar;

use Gapp::Moose;
use Gapp::SourceView;

widget 'view' => (
    is => 'rw',
    traits => [qw( GappSourceView )],
    construct => sub { },
);


package main;

my $o = Foo::Bar->new;
isa_ok $o->view, q[Gapp::SourceView];




