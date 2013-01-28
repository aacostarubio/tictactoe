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
  	@tiles.select {|tile| not tile.empty?}
  end

  def formatted
    symbols = @tiles.map{|tile| tile.symbol}
    trailers = [" |", " |", " \n", " |", " |", " \n", " |", " |", " \n"]
    s = ""
    (0..8).each {|i| s = s + symbols[i] + trailers[i]}
    return s
  end

  def display_to_user
    print formatted
    puts
  end

end