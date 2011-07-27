module IronHorse
  class Board

    def initialize
      @route_cost =     [ [ nil,  3,    nil,  nil,  nil,  3,    5   ],
                          [ 3,    nil,  2,    nil,  nil,  nil,  1   ],
                          [ nil,  2,    nil,  3,    nil,  nil,  5   ],
                          [ nil,  nil,  3,    nil,  1,    nil,  2   ],
                          [ nil,  nil,  nil,  1,    nil,  2,    2   ],
                          [ 3,    nil,  nil,  nil,  2,    nil,  5   ],
                          [ 5,    1,    5,    2,    2,    5,    nil ] ]
      
      @route_owners =   [ [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ],
                          [ nil,  nil,  nil,  nil,  nil,  nil,  nil ] ]
    end
    
    def cities
      (0..@route_owners.size)
    end
    
    def route_owner(from, to)
      return @routes[from][to]
    end
    
    def route_cost(from, to)
      return @route_cost[from][to]
    end
    
    def assign_route(player, from, to)
      @route_owners[from][to] = player
      @route_owners[to][from] = player
    end
    
    def controller_of(city)
      route_count = {}
      @route_owners[city].each do |other_city|
        owner = @route_owners[city][other_city]
        unless owner == nil
          route_count[owner] += 1
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
      
      return controller    
    end
      
  end
end