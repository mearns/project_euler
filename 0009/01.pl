#!perl

use strict;
use warnings;
use 5.010;

foreach (333 .. 998) {
    my $c = $_;
    foreach (2 .. $c-1) {
        my $b = $_;
        my $a = 1000 - $b - $c;
        if ($a < $b) {
            if ($a*$a + $b*$b == $c*$c) {
                my $prod = $a*$b*$c;
                say "$a^2 + $b^2 = $c^2, abc = $prod";
                exit 0;
            }
        }
    }
}


