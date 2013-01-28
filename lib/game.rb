class Game
  attr_accessor :grid
  attr_reader :first_player, :second_player

  def initialize(with_ui=false)
    @grid = Grid.new 9
    @first_player = Player.new("x")
    @second_player = Player.new("o")
    play(with_ui)
  end

  def first_move
  	@grid.move(@first_player.symbol, 0)
  end

  def next_move
  	tile = @second_player.get_next_tile
  	@grid.move(@second_player.symbol, 2)
  end

  def moves
    boom = rand(0..8)
    @grid.move(@first_player.symbol, boom)
    @grid.move(@second_player.symbol, boom)
  end

  def play(with_ui=false)
    first_move
  	@grid.display_to_user if with_ui
    next_move
    @grid.display_to_user if with_ui
    moves
    @grid.display_to_user if with_ui
  end
end