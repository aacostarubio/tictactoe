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
  	return "Can't move to an occupied tile" unless @tiles[position].symbol.empty?
    @tiles[position].symbol = symbol
    'OK'
  end

  def occupied
  	@tiles.select {|tile|  not tile.empty?}
  end

  def display_to_user
  	(0..2).each do |number|
      print @tiles[number].symbol + "|" 
  	end
  	puts
  	(3..5).each do |number|
      print @tiles[number].symbol + "|" 
  	end 
  	puts
  	(6..8).each do |number|
      print @tiles[number].symbol + "|" 
  	end
  	puts 
  	puts 	
  end
end