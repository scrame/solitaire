#!/usr/bin/perl -l

use strict;
use warnings;

my $DEBUG = $ENV{DEBUG};

#suits
my @suits = qw/D C H S/;

#ranks
my @ranks = qw/2 3 4 5 6 7 8 9 10 J Q K A/;


#create a deck
my @deck = create_deck();
#shuffle the deck


#create a playing field, it should have 7 slots. Each slot should have a reserve and an active card.
#when the active card is played, a card is drawn from the reserve, and if there is no reserve, the
#slot is marked as empty









#print the debug info:
print_debug();


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
