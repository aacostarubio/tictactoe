require_relative '../spec_helper'

describe Game do 

	before do
		@current_game = Game.new
		@current_game.user_interface_game = false
	end

	it 'should display default grid' do 
		@current_game.grid.size.should == 9 
	end 

	it 'should have an x player and an o player' do 
		@current_game.first_player.symbol.should == "x"	
		@current_game.second_player.symbol.should == "o"		
	end 


	it 'should start with a move by x (the computer player)' do 
		@current_game.machine_move 
		@current_game.grid.occupied.size.should == 1
    @current_game.grid.unoccupied.size.should == 8
	end

	it 'should accept 2 moves' do
		@current_game.machine_move
		@current_game.human_move(2)
		@current_game.grid.occupied.size.should == 2
	end

	it 'x and o are being played' do
		@current_game.machine_move
		@current_game.human_move(8)
		@current_game.grid.tiles.first.symbol.should == "x"
		@current_game.grid.tiles.last.symbol.should == "o"
	end

	it 'should default to a ui game' do
		@current_game = Game.new
		@current_game.user_interface_game.should be_true
	end

	it 'should allow a game with no ui for testing' do
		@current_game.user_interface_game.should be_false
	end

end
