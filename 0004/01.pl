#!perl

use strict;
use warnings;
use 5.010;

my $la;
my $lb;
my $largest = 0;

foreach (0 .. 999) {
    my $a = 999 - $_;
    foreach ((999-$a) .. 999) {
        my $b = 999 - $_;
        my $product = $a*$b;

        my @digits = $product =~ /(\d)/g;
        my $palindrome = 1;
        my $last = $#digits;
        my $length = $last + 1;
        foreach (0 .. int($length / 2)) {
            unless ($digits[$_] == $digits[$last-$_]) {
                $palindrome = 0;
            }
        }
        if ($palindrome and $product > $largest) {
            $largest = $product;
            $la = $a;
            $lb = $b;
        }
    }
}

say "$la x $lb = $largest";

