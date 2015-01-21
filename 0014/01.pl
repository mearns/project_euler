#!perl

use strict;
use warnings;
use 5.010;

my $longest_length = 0;
my $longest_start;

my %collatz_sequences;

sub collatz {
    my $start = shift;
    my $n = $start;
    my $length = 1;

    until ($n == 1) {
        if ($n & 1 == 0) {
            $n >>= 1;
        }
        else {
            $n = $n<<1 + $n + 1;
        }

        if (exists($collatz_sequences{$n})) {
            return $length + $collatz_sequences{$n};
        }
        $length += 1;
        #print "$n -> ";
    }
    $collatz_sequences{$start} = $length;
    return $length;
}

foreach (1 .. 999999) {
    my $n = $_;
    my $length = collatz $n;
    if ($length > $longest_length) {
        $longest_length = $length;
        $longest_start = $n;
    }
}

say "Longest chain starts with $longest_start (length is $longest_length)";

