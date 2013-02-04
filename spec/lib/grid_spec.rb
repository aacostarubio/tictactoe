require_relative '../spec_helper'

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
  	@grid.move("x" , 1).should == "OK"
  end

  it "should not allow a move to an occupied tile" do
  	@grid.move("x", 1)
  	@grid.move("x", 1).should == "Can't move to an occupied tile"
  end

  it "should have a formatted grid" do
    @grid.move("x", 0)
    @grid.formatted.should == "x | | \n | | \n | | \n"
  end

  describe "game over" do

    it 'is winning game when first row is filled with the same symbol' do
      @grid.move("x", 0)                
      @grid.move("x", 1)
      @grid.move("x", 2)      
      @grid.should be_win
    end

    it 'not indicate a win is there is an o in the middle' do
      @grid.move("x", 0)                
      @grid.move("o", 1)
      @grid.move("x", 2)      
      @grid.should_not be_win
    end   

  end

end