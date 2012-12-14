require 'spec_helper'
require 'grid'
require 'tile'

class Game
	attr_accessor :grid

	def initialize
		@grid = Grid.new 9
	end
	
end