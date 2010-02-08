#!/usr/bin/perl -l

#NOTE: THIS DOES NOT USE ANY REFERENCES OR MOOSE OR ANYTHING LIKE THAT, IT PASSES EVERYTHING AROUND AS LIST LITERALS BEACAUSE 
#WELL, I DIDN'T REALLY CARE IF THEY WEREN'T PASSED AROUND EFFICIENTLY. IF YOU ARE SOMEONE TRYING TO LEARN FROM THIS SCRIPT, 
#I AM VERY SORRY. THAT IS ALL.

#NOTE: IF YOU WANT DEBUGGING INFORMATION, SET THE ENVIRONMENT VARIABLE DEBUG=1!

#ALSO, I HAVE NOW USED ONE REFERENCE. THIS IS STILL NOT PRETTY CODE.

use strict;
use warnings;

my $DEBUG = $ENV{DEBUG};

#suits
my @suits = qw/D C H S/;

#ranks
my @ranks = qw/2 3 4 5 6 7 8 9 10 J Q K A/;

#seed random:
srand(rand(time()));

##MAIN FUNCTION:

#create a deck
my @deck = create_deck();

my @shuffled_deck = shuffle_deck(@deck);

#create a playing field, it should have 7 slots. Each slot should have a reserve and an active card.
#when the active card is played, a card is drawn from the reserve, and if there is no reserve, the
#slot is marked as empty


my $board_length = 7;
#deal out the board:
my @board;

#filling it out the easy way:
for(my $i=0; $i<$board_length; $i++) {
    my @row;
    for(my $j = $i; $j < $board_length; $j++) {
        push(@row, pop(@shuffled_deck));
    }
    push(@board, \@row);
}

#there is also a main reserve pile, of the cards left over after dealing.
#for now, this is just the deck.








#print the debug info:
print_debug();

##END MAIN FUNCTION

##FIELD FUNCTIONS



##END FIELD FUNCTIONS


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

sub shuffle_deck {
#shuffle the deck

    my @retval = @_;

# [edited notation]
# from wikipedia: http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
    for(my $i=scalar(@retval) - 1; $i>0 ; $i--) {
        my $j = rand($i);
        @retval[$i, $j] = @retval[$j, $i];
    }
    return @retval;
}

##END DECK FUNCTIONS

##DEBUG FUNCTIONS

#debug / test function
sub print_debug {
    if($DEBUG) {
        print "suits:";
        print @suits;
        print "rank:";
        print @ranks;
        print "deck:";
        print @deck;
        print @shuffled_deck;
        print "board:";
#        print @board;

        foreach my $row(reverse @board) {
            my $column_out = join(" ", @$row);
            print $column_out;
        }
        
        
        print "reserve:";
        print join(" ", @deck);
    }
}
