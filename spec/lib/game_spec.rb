require 'spec_helper'
require 'grid'
require 'game'

describe Game do 

	before do
		@current_game = Game.new
	end

	it 'should display default grid' do
		@current_game.grid.size.should == 9
	end

	it 'should have an x player and an o player' do
    @current_game.first_player.symbol.should == "x"		
    @current_game.second_player.symbol.should == "o"		
	end

	it 'should start with a move by x (the computer player)' do
		@current_game.machine_move(0)
    @current_game.grid.occupied.size.should == 1
    @current_game.grid.unoccupied.size.should == 8
	end

	it 'should not accept a human move as a first move' do
		@current_game.human_move(1)
		@current_game.grid.occupied.size.should == 0
	end

	it 'should accept 2 moves' do
		@current_game.machine_move(0)
		@current_game.human_move(2)
		@current_game.grid.occupied.size.should == 2
	end

	it 'x and o are being played' do
		@current_game.machine_move(0)
		@current_game.human_move(8)
		puts @current_game.grid.tiles.first.inspect
		@current_game.grid.tiles.first.symbol.should == "x"
		@current_game.grid.tiles.last.symbol.should == "o"
	end

	it 'know if machine wins' do
		@current_game.machine_move(0)
		@current_game.human_move(3)
		@current_game.machine_move(1)
		@current_game.human_move(5)
		@current_game.machine_move(2)
		@current_game.grid.occupied.should == ''
		@current_game.grid.occupied.size.should == 5
		@current_game.winner.should == @current_game.first_player.symbol
	end

end