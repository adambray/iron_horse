require_relative "../lib/iron_horse"

include IronHorse

def game_status(game)
  puts
  puts ("=" * 30) + "Game Status" + ("=" * 30)
  puts ("-" * 30) + "City Ownership" + ("-" * 27)
  game.board.cities.each do |city|
    owner = game.board.owner_of(city)
    owner ||= "nobody"
    puts "City ##{city} is owned by #{owner}"
  end
  puts ("-" * 30) + "Scores" + ("-" * 35)
  game.players.each do |player|  
    puts "#{player}: #{player.score}"
  end
  puts
end



# Create Players
alice = Player.new("Alice", 1)
bob = Player.new("Bob", 4)
charlie = Player.new("Charlie", 6)

# Create a new game
example_game = Game.new([alice, bob, charlie])

# Players take turns building and stealing routes
alice.build_route(1,2)
bob.build_route(4,7)
charlie.build_route(6,1)
alice.build_route(2,3)
bob.build_route(7,1)

game_status(example_game)

charlie.steal_route(1,7)
alice.steal_route(1,7)
bob.build_route(4,5)
charlie.build_route(6,5)

game_status(example_game)