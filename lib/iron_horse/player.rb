module IronHorse
  class Player
    attr_reader :name, :game
        
    def initialize(name, home_city)
      @name = name
      @train_cards = 50
      @home_city = home_city
    end
    
    def to_s
      name
    end
    
    def game=(game)
      @game ||= game
    end
   
    def build_route(from, to)
      cost = game.board.route_cost(from, to)

      current_owner = game.board.route_owner(from, to)
      if current_owner != nil
        message = "#{self} can't build. #{current_owner} already owns that route." 
      elsif (!controlled_cities.include? from) && @home_city != from
        message = "#{self} can't build. They don't own an adjacent city."
      elsif @train_cards < cost
        message = "#{self} can't build. They don't have enough cards left to buy that route."
      else
        game.board.assign_route(self, from, to)
        @train_cards -= cost
        message = "#{self} built route from city ##{from} to city ##{to}"
      end
      
      puts message
      check_for_game_end
    end

    def steal_route(from, to)
      defender = game.board.route_owner(from, to)
      if defender == nil
        message = "#{self} can't steal. No one owns that route."
      elsif (!controlled_cities.include? from) && @home_city != from
        message = "#{self} can't steal. They don't own an adjacent city."
      elsif game.board.route_owner(from, to) == self
        message = "#{self} can't steal. They already own that route."
      else
        stealer_roll = 2 + rand(6) + rand(6)
        defender_roll = 3 + rand(6) + rand(6) + rand(6)
        if stealer_roll > defender_roll
          game.board.assign_route(self, from, to)
          message = "#{self} stole route from city ##{from} to city ##{to} from #{defender}!"
        else
          @train_cards -= 2
          message = "#{self} failed to steal route from #{defender}!"
        end
      end
      
      puts message
      check_for_game_end
    end
    
    def controlled_cities
      game.board.cities.select{|city| game.board.owner_of(city) == self}
    end
       
    def score
      controlled_cities.size
    end
        
    def check_for_game_end
      game.end_game if @train_cards == 0
    end
              
  end
end