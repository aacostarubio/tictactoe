require_relative 'game'
require_relative 'grid'
require_relative 'tile'
require_relative 'player'

game = Game.new
game.machine_move(1)
game.grid.display_to_user
game.human_move(3)
game.grid.display_to_user
game.machine_move(0)
game.grid.display_to_user
game.human_move(4)
game.grid.display_to_user
game.machine_move(2)
game.grid.display_to_user

if game.grid.horizontal_win?
	puts "You won X"
end

