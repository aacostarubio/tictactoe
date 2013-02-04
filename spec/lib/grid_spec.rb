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

  describe "horizontal win" do

    it 'is winning game when first row is filled with the same symbol' do
      @grid.move("x", 0)                
      @grid.move("x", 1)
      @grid.move("x", 2)      
      @grid.should be_horizontal_win
    end

    it 'is NOT a winning game when first row is filled with the same symbol' do
      @grid.move("x", 0)                
      @grid.move("o", 1)
      @grid.move("x", 2)      
      @grid.should_not be_horizontal_win
    end    

    it 'is a winning game is the second row has the same symbols' do
      @grid.move("x", 3)                
      @grid.move("x", 4)
      @grid.move("x", 5)      
      @grid.should be_horizontal_win
    end

    it 'is not a win is there an o in any place' do
      @grid.move("x", 3)                
      @grid.move("x", 4)
      @grid.move("o", 5)      
      @grid.should_not be_horizontal_win
    end    

    it 'is winning game when third rown is filled with the same symbol' do
      @grid.move("x", 6)
      @grid.move("x", 7)
      @grid.move("x", 8)
      @grid.should be_horizontal_win
    end

    it 'not a win if there is an o in the middle of the third row' do
      @grid.move("o", 6)
      @grid.move("x", 7)
      @grid.move("x", 8)
      @grid.should_not be_horizontal_win
    end    

  end

  describe 'vertical win' do

    it 'is a winning game when the first column has the same symbols' do
      @grid.move("x", 0)
      @grid.move("x", 3)
      @grid.move("x", 6)
      @grid.should be_vertical_win
    end

    it 'is NOT a winning a game is there is an o in the middle of the first column' do
      @grid.move("x", 0)
      @grid.move("o", 3)
      @grid.move("x", 6)
      @grid.should_not be_vertical_win
    end

    it 'is a win if there are the same symbols in the second column' do
      @grid.move("x", 1)
      @grid.move("x", 4)
      @grid.move("x", 7)
      @grid.should be_vertical_win
    end

    it 'is NOT a win if there is an o in the middle of the column' do
      @grid.move("x", 1)
      @grid.move("o", 4)
      @grid.move("x", 7)
      @grid.should_not be_vertical_win
    end

    it 'is a win if there are the same symbols in the third column' do
      @grid.move("x", 2)
      @grid.move("x", 5)
      @grid.move("x", 8)
      @grid.should be_vertical_win
    end

    it 'is NOT a win if there is an o in the middle of the third column' do
      @grid.move("x", 2)
      @grid.move("x", 5)
      @grid.move("o", 8)
      @grid.should_not be_vertical_win
    end

  end

  describe 'diagonal win' do

    it 'should indicate a win if there are the same symbols in the right diagonal column' do
      @grid.move("x", 0)
      @grid.move("x", 4)
      @grid.move("x", 8)
      @grid.should be_diagonal_win
    end

    it 'should NOT indicate a win if there are any o in the middle' do
      @grid.move("x", 0)
      @grid.move("o", 4)
      @grid.move("x", 8)
      @grid.should_not be_diagonal_win
    end 

    it 'should indicate a win if there are the same symbols in the left diagonal column' do
      @grid.move("x", 2)
      @grid.move("x", 4)
      @grid.move("x", 6)
      @grid.should be_diagonal_win
    end

    it 'should NOT indicate a win if there is an o any place in the column' do
      @grid.move("x", 2)
      @grid.move("o", 4)
      @grid.move("x", 6)
      @grid.should_not be_diagonal_win
    end        

  end

  context 'a draw of the game' do

    it 'should indicate a draw if all the boxes are filled with no match' do
      @grid.move("x", 0)
      @grid.move("o", 1)
      @grid.move("x", 2)
      @grid.move("x", 3)
      @grid.move("o", 4)
      @grid.move("o", 5)
      @grid.move("o", 6)
      @grid.move("x", 7)
      @grid.move("x", 8)
      @grid.should be_draw
    end

  end


end