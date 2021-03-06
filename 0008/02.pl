#!perl
#
##
# This is optimized considerably compared to the solution in 01.pl.
# Instead of being O(NM), this is just O(N), so roughly spekaing,
# 13 times faster.
#
# Instead of finding independent products for each subsequence, it does a
# running product with a sliding window. The trick is to through away the entire
# window anytime you encounter a 0.
#
# So I don't see how you could get any better than O(N), since you have to search the
# entire sequence. But I'm sure you can still get the actual amount of time down
# with some clever optimizations.
#
# For one thing, I think you could do probably sums instead of products. I'm not
# confident about that, but I suspect if a sequence of fixed length has a higher product,
# then it necessarily has a higher sum as well.
#
# I thought there might be some clever things to do with sorting the subsequences,
# but sorting subsequences is going to be worse than O(M), so we're already worse.
#

use strict;
use warnings;
use 5.010;

my $string = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";

my $highest_prod = 0;
my $length = 13;

my @subseq;
my $prod = 1;

while ($string =~ /(\d)/g) {
    my $d = $1;

    push @subseq, $d;
    if ($d == 0) {
        $prod = 1;
        @subseq = ();
    }
    else {
        $prod *= $d;
        if ($#subseq+1 == $length+1) {
            my $rm = shift @subseq;
            $prod /= $rm;
            if ($prod > $highest_prod) {
                $highest_prod = $prod;
            }
        }
    }
}

say '-------------------------';
say $highest_prod;

