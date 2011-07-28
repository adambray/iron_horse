module IronHorse
  class Board
    
    attr_reader :cities, :route_owners
    def initialize
      @route_cost =     [ [ nil,  10,   nil,  nil,  nil,  20,   30 ],
                          [ 30,    nil,  20,    nil,  nil,  nil,  10   ],
                          [ nil,  20,    nil,  30,    nil,  nil,  25   ],
                          [ nil,  nil,  30,    nil,  10,    nil,  20   ],
                          [ nil,  nil,  nil,  10,    nil,  20,    20   ],
                          [ 30,    nil,  nil,  nil,  20,    nil,  25   ],
                          [ 25,    10,    25,    20,    20,    25,    nil ] ]
      
       @route_owners = Array.new(7) { Array.new(7, nil)}
       @cities = Array.new(@route_owners.size) {|a| a + 1}
    end
        
    def route_owner(from, to)
      @route_owners[from - 1][to - 1]
    end
    
    def route_cost(from, to)
      cost = @route_cost[from - 1][to - 1]
      # If route doesn't exist, it's the same as infinite cost
      cost ? cost : (1.0/0)
    end
    
    def assign_route(player, from, to)
      @route_owners[from - 1][to - 1] = player
      @route_owners[to - 1][from - 1] = player
    end
    
    def owner_of(city)

      route_count = {}
      @cities.each do |other_city|
        owner = @route_owners[city - 1][other_city - 1]
        unless owner == nil
          if route_count[owner]
            route_count[owner] += 1
          else
            route_count[owner] = 1
          end
        end 
      end
      
      max_count = 0
      controller = nil
      route_count.each_pair do |player, count|
        if count == max_count
          controller = nil
        elsif count > max_count
          controller = player
        end
      end
      
      controller
    end
      
  end
end