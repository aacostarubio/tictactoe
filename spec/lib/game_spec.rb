require 'spec_helper'
require 'grid'
require 'game'

describe Game do 

	it 'should display default grid' do
		@current_player = Game.new
		@current_player.grid.size.should == 9
	end

end