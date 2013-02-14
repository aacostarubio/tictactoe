class Game
  attr_accessor :grid, :user_interface_game
  attr_reader :first_player, :second_player

  def initialize
    @grid = Grid.new 9
    @first_player = Player.new("x")
    @second_player = Player.new("o")
    @user_interface_game = true
  end

  def machine_move
    @grid.move(@first_player.symbol, @grid.first_unoccupied_tile_number)
  end

  def human_move(tile_number=-1)
    if @user_interface_game
      puts "Please enter you move: "
      tile_number = gets.chomp.to_i
    end
    begin
      @grid.move(@second_player.symbol, tile_number)
    rescue OccupiedError
      puts "Occupied tile Dude, pick another one"
    end        
  end

  def moves
    while @grid.game_over? == false && user_interface_game
      if @grid.unoccupied.count.odd?
        machine_move
        @grid.display_to_user 
      end
      if @grid.unoccupied.count.even?
        human_move
        @grid.display_to_user
      end      
    end
  end

end
