module IronHorse
  class Player
    attr_reader :name, :game
        
    def initialize(name)
      @name = name
      @train_cards = 50
    end
    
    def game=(game)
      @game ||= game
    end
   
    def build_route(from, to)
      cost = game.board.route_cost(from, to)
      
      if game.board.route_owner(from, to) != nil
        return "Someone already owns that route." 
      elsif !controlled_cities.include? from
        return "You don't own an adjacent city."
      elsif @train_cards < cost
        return "You don't have enough cards left to buy that route."
      else
        game.board.assign_route(self, from, to)
        @train_cards -= cost
      end
      
      check_for_game_end      
    end

    def steal_route(from, to)
      if game.board.route_owner(from, to) == nil
        return "No one owns that route."
      elsif !controlled_cities.include? from
        return "You don't own an adjacent city."
      elsif game.board.route_owner(from, to) == self
        return "You already own that route."
      else
        stealer_roll = 2 + rand(6) + rand(6)
        defender_roll = 3 + rand(6) + rand(6) + rand(6)
        if stealer_roll > defender_roll
          game.board.assign_route(self, from, to)
        else
          @train_cards -= 2
        end
      end

      check_for_game_end
    end
    
    def controlled_cities
      game.board.cities.select{|city| game.board.controller_of(city) == self }
    end
       
    def score
      controlled_cities.size
    end
        
    def check_for_game_end
      game.end_game if @train_cards == 0
    end
              
  end
end