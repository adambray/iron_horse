class ResourceDeck
  
  attr_reader :main_pile, :face_up_pile, :discard_pile
  
  def initialize(kind_and_number)
    @main_pile = []
    @face_up_pile = []
    @discard_pile = []

    kind_and_number.each do |kind, number|
      number.times do
        @main_pile << kind
      end
    end
    @main_pile.shuffle!
  end

  def draw_from_main_pile
    @drawn_card = @main_pile.delete_at(0)
    reshuffle_deck if @main_pile.empty? 
  end
  
  def draw_from_face_up
    @face_up_pile.delete_at
  end
    
  
  def return_card(kind)
    
  end
  
  private
  
  def reshuffle_deck
    @main_pile = @discard_pile.shuffle
    @discard_pile = []
  end

end