require_relative "board"
require_relative "human_player"

class Game
  attr_reader :current_player

  def initialize(player_1_mark, player_2_mark)
    @player_1 = Human_player.new(player_1_mark)
    @player_2 = Human_player.new(player_2_mark)
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark_value)
      if @board.win?(current_player.mark_value)
        p "#{@current_player} Won"
        @board.print
        return
      end
      self.switch_turn
    end
    @board.print
    p "Its a draw"
  end
end

game = Game.new(:😀, :🥶)

game.play
