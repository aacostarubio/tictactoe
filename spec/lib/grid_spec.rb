require 'spec_helper'
require 'grid'

describe Grid do

	it "should have 9 boxes" do 
		@grid = Grid.new
		@grid.size.should == 9
		end

	it "should have an input of x in the tile" do
		@grid = Grid.new
		@grid.move("x", 0)
		@grid.tiles[0].symbol.should == 'x'
	end
	
end 