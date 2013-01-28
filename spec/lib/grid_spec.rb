require 'spec_helper'
require 'grid'
require 'player'

describe Grid do
	before :each do
		@grid = Grid.new
	end

  it "should have normal grid size" do 
		@grid.size.should == 9
  end

  it "should allow move to input x into the tile" do
		@grid.move("x", 0)
		@grid.tiles[0].symbol.should == 'x'
  end

  it "should get symbol from player" do
		@player = Player.new("x")
		@grid.move(@player.symbol, 0)
		@grid.tiles[0].symbol.should == 'x'
  end 

  it "should allow a move to an unoccupied tile" do
  	@grid.move("x", 1).should == "OK"
  end

  it "should not allow a move to an occupied tile" do
  	@grid.move("x", 1)
  	@grid.move("x", 1).should == "Can't move to an occupied tile"
  end

  it "should have a formatted grid" do
    @grid.move("x", 0)
    @grid.formatted.should == "x | | \n | | \n | | \n"
  end

end