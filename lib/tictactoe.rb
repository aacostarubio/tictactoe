require_relative 'require_game'

game = Game.new
game.moves

	if game.grid.horizontal_win?
		game.grid.game_over?
		print 'you won horizontal sir'
	elsif game.grid.vertical_win?
		game.grid.game_over?
		print "You won vertically good sir"
	elsif game.grid.diagonal_win?
		game.grid.game_over?
		print "You won diagonally awesome Mr. Person"
	elsif game.grid.draw? && game.grid.game_over?
		print "game is a DRAW! Stand BACK!!!"
	end

