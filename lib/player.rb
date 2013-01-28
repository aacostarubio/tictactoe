class Player
	attr_accessor :tiles

	def initialize(symbol)
		@symbol = symbol
	end

	def symbol
		@symbol
	end

	def get_next_tile
		rand(0..8)
	end
end