class MainDeck
  
  attr_reader :main_pile, :discard_pile
  
  def initialize(kind_and_number)
    @main_pile = []
    @discard_pile = []

    kind_and_number.each do |kind, number|
      number.times do
        @main_pile << kind
      end
    end
    @main_pile.shuffle!
  end

  def draw!
    @drawn_card = @main_pile.delete_at(0)
    reshuffle_deck if @main_pile.empty?
    @drawn_card
  end
    
  def return_card(kind)
    @discard_pile << kind
  end
  
  private
  
  def reshuffle_deck
    @main_pile = @discard_pile.shuffle
    @discard_pile = []
  end

end



class FaceUpDeck

  attr_reader :cards

  def initialize(size, deck)
    @cards = []
    size.times do
      @cards << deck.draw!
    end
  end
  
  def draw!(kind, deck)
    @cards[@cards.index(kind)] = deck.draw!
    return kind
  end

end