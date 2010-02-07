#!/usr/bin/perl -l

#NOTE: IF YOU WANT DEBUGGING INFORMATION, SET THE ENVIRONMENT VARIABLE DEBUG!


use strict;
use warnings;

my $DEBUG = $ENV{DEBUG};

#suits
my @suits = qw/D C H S/;

#ranks
my @ranks = qw/2 3 4 5 6 7 8 9 10 J Q K A/;

#seed random:
srand(localtime());

##MAIN FUNCTION:

#create a deck
my @deck = create_deck();

#shuffle the deck

# [edited notation]
# from wikipedia: http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle


#   for n from m - 1 downto 1 do
for(my $i=(@deck); $i>=0 ; $i--) {

#         j = random (0 .. n)
#my $j = 

#         swap a[j], a[n]

}


#create a playing field, it should have 7 slots. Each slot should have a reserve and an active card.
#when the active card is played, a card is drawn from the reserve, and if there is no reserve, the
#slot is marked as empty









#print the debug info:
print_debug();

##END MAIN FUNCTION


##DECK FUNCTIONS
sub create_deck {
    my @deck;
    foreach my $rank(@ranks) {
        foreach my $suit(@suits) {
            push(@deck, "$rank$suit");
        }
    }
    #TODO: maybe use a ref here?
    return @deck;
}



##DEBUG FUNCTIONS

#debug / test function
sub print_debug {
    if($DEBUG) {
        print "suits:";
        print @suits;
        print "rank:";
        print @ranks;
        print "deck:";
        print create_deck();
    }
}
