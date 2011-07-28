module IronHorse
  class Game
    attr_reader :board, :players
    
    def initialize(players)
      @players = players
      players.each do |player|
        player.game = self
      end
      
      @board = Board.new
    end

    def end_game
      max_score = 0
      winners = []
      @players.each do |player|
        if player.score > max_score
          winners = [player.name]
          max_score = player.score
        elsif player.score == max_score
          winners << player.name
        end
      end
      
      if winners.size > 1
        puts "It's a tie between #{winners.join(", ")}"
      else
        puts "#{winners.first} is the winner!"
      end
      
      
    end
      
  end
end