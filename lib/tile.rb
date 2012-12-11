class Tile
	attr_accessor :symbol

	def empty?
	 	symbol.nil? || symbol == ""
	end 

	def x?
		symbol == "x"
	end

	def o?
		symbol == "o"
	end
end
