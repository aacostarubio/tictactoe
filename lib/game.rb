
class Game
  attr_accessor :grid, :user_interface_game
  attr_reader :first_player, :second_player

  def initialize
    @grid = Grid.new 9
    @first_player = Player.new("x")
    @second_player = Player.new("o")
    @user_interface_game = true
  end

  def machine_move(tile_number)
    if @grid.occupied.count.even?
      @grid.move(@first_player.symbol, tile_number)
    end
  end

  def human_move(tile_number=-1)
    if @user_interface_game
      puts "Please enter you move: "
      tile_number = gets.chomp.to_i
    end
    if @grid.occupied.count.odd? && tile_number != -1
      @grid.move(@second_player.symbol, tile_number)
    end
  end

  def moves
    while @grid.game_over? == false
      machine_move(rand(0..8))
      @grid.display_to_user
      if @user_interface_game
        human_move
      else
        human_move(rand(0..8))   
      end
      @grid.display_to_user
    end
  end

end