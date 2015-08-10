#!/usr/bin/env perl

use v5.10.0;
use warnings;
use strict;
my $count = 0;
my $largest = 0;
for (my $i = 999; $i > 99; $i--) {
  for (my $j = 999; $j > 99; $j--) {
    $count = $count + 1;
    my $v = $i * $j;
    my $str = "$v";
    my $rstr = reverse($str);
    if ($rstr eq $str) {
      if ($v > $largest) {
        say $str;
        $largest = $v;
      }
    }

  }
}
say $count;
