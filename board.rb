require_relative 'piece'
require_relative 'null_piece'
require_relative 'sliding_piece'
require_relative 'stepping_piece'
require_relative 'pawn'
require 'byebug'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    board_setup
  end

  def board_setup
    types = [Rook, Knight, Bishop, Knight,
      King, Bishop, Knight, Rook]
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if row_idx == 0
          @grid[row_idx][col_idx] = types[col_idx].new(:black)
        elsif row_idx == 7
          @grid[row_idx][col_idx] = types[col_idx].new(:white)
        elsif row_idx == 1
          @grid[row_idx][col_idx] = Pawn.new(:black)
        elsif row_idx == 6
          @grid[row_idx][col_idx] = Pawn.new(:white)
        else
          @grid[row_idx][col_idx] = NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row,col = pos
    @grid[row][col] = value
  end

  def valid_start?(start_pos,current_player)
    # debugger
    return false if start_pos.any? { |el| !el.between?(0, 7) }
    return false if self[start_pos].class == NullPiece
    return false if self[start_pos].color != current_player.color
    true
  end

  def valid_end?(start_pos, end_pos)
    # debugger
    return true if self[start_pos].moves(start_pos,self).include?(end_pos)
    false
  end

  def dup()
  end

  def move(start_pos, end_pos)
    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def checkmate?()
    false
  end

  def find_king(color)
  end
end
