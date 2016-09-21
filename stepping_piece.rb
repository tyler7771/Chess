require 'byebug'
require_relative 'piece'

module SteppingPiece
  def moves(start_pos,board)
    possible_moves = []

    move_diffs.each do |move|
      end_pos = [(start_pos[0] + move[0]), (start_pos[1] + move[1])]
      # debugger
      unless board[end_pos].color == self.color ||
        end_pos.all? { |el| !el.between?(0, 7)}
        possible_moves << end_pos
      end
    end
    possible_moves
  end
end

class King < Piece
  attr_reader :color
  include SteppingPiece
  def initialize(color)
    super
  end

  def symbol
    :♚
  end

  def move_diffs
    [[1,1], [-1,1], [-1,-1], [1,-1], [1,0], [0,1], [-1,0], [0,-1]]
  end
end

class Knight < Piece
  attr_reader :color
  include SteppingPiece
  def initialize(color)
    super
  end

  def symbol
    :♞
  end

  def move_diffs
    [[2,1], [2,-1], [1,2], [1,-2], [-1,2], [-1,-2], [-2,1], [-2,-1]]
  end
end
