require 'tile'
class Grid
	attr_accessor :tiles

	def initialize(size=9)
		@tiles = []
		size.times do
				@tiles << Tile.new
		end	
	end

	def size
		@tiles.size
	end

	def move(symbol, position)
		@tiles[position].symbol = symbol
	end
end