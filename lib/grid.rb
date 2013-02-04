class Grid
  attr_accessor :tiles

  def initialize(size=9)
    @tiles = []
		size.times do
	  	@tiles << Tile.new
		end	

    first_row_win       = [0,1,2]
    second_row_win      = [3,4,5]
    third_row_win       = [6,7,8]

    first_column_win    = [0,3,6]
    second_column_win   = [1,4,7]
    third_column_win    = [2,5,8]

    left_diagonal_win   = [0,4,8]
    right_diagonal_win  = [2,4,6]

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

  def unoccupied
    @tiles.select {|tile| tile.empty?}    
  end

  def formatted
    symbols = @tiles.map{|tile| tile.symbol}
    trailers = [" |", " |", " \n", " |", " |", " \n", " |", " |", " \n"]
    s = ""
    (0..8).each {|i| s = s + symbols[i] + trailers[i]}
    s
  end

  def win?
    @tiles[1].symbol == "x" || @tiles[3].symbol == "x" || @tiles[7].symbol == "x"
  end

  def display_to_user
    print formatted
    puts
  end

end