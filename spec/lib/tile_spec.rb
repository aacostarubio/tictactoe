require_relative '../spec_helper'

describe Tile do
	before do
		@tile = Tile.new
	end

	it "should be an empty box" do
		@tile.should be_empty
	end

	it "should have input like x or o" do	
		@tile.symbol = 'x'
		@tile.should be_x
	end

end



