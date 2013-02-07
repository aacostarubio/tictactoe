require "color_text"

require_relative 'game'
require_relative 'grid'
require_relative 'tile'
require_relative 'player'

game = Game.new
game.moves
game.grid.display_to_user

	if game.grid.horizontal_win?
		print 'you won horizontal sir'
	elsif game.grid.vertical_win?
		print "You won vertically good sir"
	elsif game.grid.diagonal_win?
		print "You won diagonally awesome Mr. Person"
	elsif game.grid.draw? && game.grid.game_over?
		print "game is a DRAW! Stand BACK!!!"
	end

