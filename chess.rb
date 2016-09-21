require_relative 'board'
require_relative 'player'
require_relative 'display'
require 'byebug'

class Chess
  def initialize(player1, player2)
    @player1 = HumanPlayer.new(player1, :black)
    @player2 = HumanPlayer.new(player2, :white)
    @current_player = @player1
    @board = Board.new
  end

  def play
    new_board = Display.new(@board)
    until @board.checkmate?()
      new_board.render
      begin
        start_pos = @current_player.get_starting_position
        raise "error" unless @board.valid_start?(start_pos,@current_player)
        rescue StandardError => e
          puts "That's not a valid starting position! Try again."
          retry
      end
      begin
        end_pos = @current_player.get_ending_position
        raise "error" unless @board.valid_end?(start_pos, end_pos)
        rescue StandardError => e
          puts "That's not a valid move! Try again."
          retry
      end
      @board.move(start_pos,end_pos)
      swap_turn!
    end
    puts "#{@current_player} is the winner!"
  end



  def notify_players
  end

  def swap_turn!
    @current_player =  @current_player == @player1 ? @player2 : @player1
  end
end

if __FILE__ == $PROGRAM_NAME
  chess = Chess.new("Mandy", "Tyler")
  # debugger
  chess.play
end
