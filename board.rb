# require_relative "game"
# require_relative 'display'
require_relative "piece"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { Piece.new }}
  end

  def [](pos)
  end

  def []=
  end

  def dup()
  end

  def move(color,start_pos, end_pos)
    begin
      Player.get_input
      unless Piece.valid_moves(start_pos).include?(end_pos)
        raise "error"
      end
    rescue StandardError => e
      puts "That's not a valid move! Try again."
      retry
    end
    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)
    #start_pos => Nullpiece
    #end_pos => moved piece
  end

  def checkmate?()
  end

  def find_king(color)
  end
end

b = Board.new
p b
