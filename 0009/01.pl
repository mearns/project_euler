#!perl

use strict;
use warnings;
use 5.010;

foreach (334 .. 997) {
    my $c = $_;
    foreach (1 .. 333) {
        my $a = $_;
        my $b = 1000 - $a - $c;
        if ($a < $b) {
            if ($a*$a + $b*$b == $c*$c) {
                my $prod = $a*$b*$c;
                say "$a^2 + $b^2 = $c^2, abc = $prod";
                exit 0;
            }
        }
    }
}


