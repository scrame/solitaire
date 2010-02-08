#!/usr/bin/ruby -w


class Card
  attr_accessor :suit, :rank
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

deck = Deck.new()

while(0 < deck.reserve) do
  puts deck.deal()
end

