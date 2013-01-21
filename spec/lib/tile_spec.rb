require 'spec_helper'
require 'tile'

describe Tile do

	it "should be an empty box" do
			@tile = Tile.new
			@tile.should be_empty
	end

	it "should have input like x or o" do	
		@tile = Tile.new	
		@tile.symbol = 'x'
		@tile.should be_x
	end

end



