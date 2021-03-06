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
    raise OccupiedError unless @tiles[position].empty?
    @tiles[position].symbol = symbol
  end

  def occupied
  	@tiles.select {|tile| not tile.empty?}
  end

  def unoccupied
    @tiles.select {|tile| tile.empty?}    
  end

  def first_unoccupied_tile_number
    @tiles.each_with_index do |tile, index|
      return index if tile.empty?
    end
  end

  def formatted
    symbols = @tiles.map{|tile| tile.symbol}
    trailers = [" |", " |", " \n", " |", " |", " \n", " |", " |", " \n"]
    s = ""
    (0..8).each {|i| s = s + symbols[i] + trailers[i]}
    s
  end


  def horizontal_win?
    if (@tiles[0].symbol == "x" && @tiles[1].symbol == "x" && @tiles[2].symbol == "x") || (@tiles[0].symbol == "o" && @tiles[1].symbol == "o" && @tiles[2].symbol == "o")
      true
    elsif (@tiles[3].symbol == "x" && @tiles[4].symbol == "x" && @tiles[5].symbol == "x") || (@tiles[3].symbol == "o" && @tiles[4].symbol == "o" && @tiles[5].symbol == "o")
      true
    elsif (@tiles[6].symbol == "x" && @tiles[7].symbol == "x" && @tiles[8].symbol == "x") || (@tiles[6].symbol == "o" && @tiles[7].symbol == "o" && @tiles[8].symbol == "o")
      true     
    else
      return false
    end
  end

  def vertical_win?
    if (@tiles[0].symbol == "x" && @tiles[3].symbol == "x" && @tiles[6].symbol == "x") || (@tiles[0].symbol == "o" && @tiles[3].symbol == "o" && @tiles[6].symbol == "o")
      true
    elsif (@tiles[1].symbol == "x" && @tiles[4].symbol == "x" && @tiles[7].symbol == "x") || (@tiles[1].symbol == "o" && @tiles[4].symbol == "o" && @tiles[7].symbol == "o")
      true
    elsif (@tiles[2].symbol == "x" && @tiles[5].symbol == "x" && @tiles[8].symbol == "x") || (@tiles[2].symbol == "o" && @tiles[5].symbol == "o" && @tiles[8].symbol == "o")
      true      
    else
      false
    end
  end

  def diagonal_win?
    if (@tiles[0].symbol == "x" && @tiles[4].symbol == "x" && @tiles[8].symbol == "x") || (@tiles[0].symbol == "o" && @tiles[4].symbol == "o" && @tiles[8].symbol == "o")
      true
    elsif (@tiles[2].symbol == "x" && @tiles[4].symbol == "x" && @tiles[6].symbol == "x") || (@tiles[2].symbol == "o" && @tiles[4].symbol == "o" && @tiles[6].symbol == "o")
      true
    else
      false
    end
  end

  def all_tiles_played?
    @tiles.select {|tile| tile if tile.empty? }.count == 0
  end

  def draw?
    (all_tiles_played? && !horizontal_win? && !vertical_win? && !diagonal_win?)
  end

  def game_over?
    if horizontal_win?
      return true
    elsif vertical_win?
      return true
    elsif diagonal_win?
      return true
    elsif draw?
      return true
    else
      false
    end
  end

  def display_to_user
    print formatted
    puts
  end

end

class OccupiedError < Exception
  def message
    "nop buddy"
  end
end