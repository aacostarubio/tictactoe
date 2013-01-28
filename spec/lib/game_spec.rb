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
    @current_game.grid.occupied.size.should == 2
	end

	it 'should get second move from o (the live player)' do
    @current_game.grid.occupied.size.should == 2
	end

	it 'should record a third move' do
		@current_game.grid.occupied.size.should == 2
	end
end