#!perl
#
##Answer is 837799. It has a length of 525.

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
    my @seq = ($n,);

    #print "$n ";
    until ($n == 1) {
        if ($n % 2 == 0) {
            $n /= 2;
        }
        else {
            $n = 3*$n + 1;
        }
        #print " -> $n";

        if (exists($collatz_sequences{$n})) {
            $length += $collatz_sequences{$n};
            $n = 1;
        } else {
            push @seq, $n;
            $length += 1;
        }
    }
    my $i = 0;
    foreach (@seq) {
        $n = $_;
        $collatz_sequences{$n} = $length-$i;

        $i += 1;
    }
    return $length;
}

#Prefill table for powers of two. This appears to be very marginally faster.
my $n = 2;
my $i = 1;
while ($n < 1_000_000) {
    $i += 1;
    $collatz_sequences{$n} = $i;
    $n *= 2;
}
say "Pre loaded.";

foreach (1 .. 999_999) {
    $n = $_;
    my $length = collatz $n;
    if ($length > $longest_length) {
        $longest_length = $length;
        $longest_start = $n;
    }
}

say "Longest chain starts with $longest_start (length is $longest_length)";

