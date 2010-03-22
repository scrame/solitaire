#!/usr/bin/ruby -w


class Card
  attr_reader :suit, :rank
  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def to_s()
    return "#{rank} of #{suit}"
  end
end

class Deck
  @@suits = [:diamond, :clubs, :hearts, :spades]
  @@ranks = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  attr_accessor :deck
  def initialize()
    @deck = Array.new
    @@suits.each do |suit|
      @@ranks.each do |rank|
        @deck.push(Card.new(suit,rank));
      end
    end
    puts "shuffling"
    shuffle()
  end

  def shuffle()
    @deck = @deck.sort_by { rand } 
  end

  def deal()
    return @deck.pop
  end

  def reserve()
    return @deck.length
  end
end

class Board
  attr_accessor :grid

  def initialize(deck)
    #clear out the right sizes for each array in the board.
    @grid = Array.new();
    for i in (1..7)
      @grid[i-1] = Array.new(i)      
    end
    
    #set up from the deck
    for i in (0.upto(@grid.length-1))
      for j in (0.upto(@grid[i].length-1))
        @grid[i][j] = deck.deal        
      end
    end
  end

end


class Game
  attr_accessor :board, :reserve, :foundations
  
  def initialize()
    @foundations = {:aces => [], :diamonds => [], :spades => [], :clubs => []}
    @reserve = Deck.new
    @board = Board.new(@reserve)
  end

  def play()
    while(0 != @reserve.reserve()) do
      puts @reserve.deal()
    end
  end

end

##MAIN

game = Game.new()

game.play()
