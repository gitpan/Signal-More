#!perl

BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

#
# This file is part of Signal-More
#
# This software is copyright (c) 2011 by Leon Timmermans.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#

# This test is generated by Dist::Zilla::Plugin::Test::Kwalitee
use strict;
use warnings;
use Test::More;   # needed to provide plan.
eval "use Test::Kwalitee";

plan skip_all => "Test::Kwalitee required for testing kwalitee" if $@;
