class Game
  attr_accessor :grid
  attr_reader :first_player, :second_player

  def initialize
    @grid = Grid.new 9
    @first_player = Player.new("x")
    @second_player = Player.new("o")
  end

  def machine_move(tile_number)
    @grid.move(@first_player.symbol, tile_number)
  end

  def human_move(tile_number)
    if @grid.occupied.count.odd?
      @grid.move(@second_player.symbol, tile_number)
    end
  end

end