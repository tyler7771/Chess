require 'byebug'
require_relative 'piece'

module SlidingPiece
  def moves(start_pos)
    possible_moves = []
    self.class::MOVES_DIRECTIONS.each do |move|
      end_pos = (start_pos[0] + move[0]), (start_pos[1] + move[1])
      until @grid[end_pos].class != NullPiece ||
        end_pos.all? { |el| el.between?(0, 7)}
        possible_moves << end_pos
        end_pos = (end_pos[0] + move[0]), (end_pos[1] + move[1])
      end
      if @grid[end_pos].class != NullPiece
        if @grid[end_pos].color != @current_player.color
          possible_moves << end_pos
        end
      end
    end
    possible_moves
  end
end

class Queen < Piece
  MOVES_DIRECTIONS = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0],
  [0, 1], [-1, 0], [0, -1]]
  attr_reader :color
  include SlidingPiece
  def initialize(color)
    super
  end

  def symbol
    :♛
  end
end

class Rook < Piece
  MOVES_DIRECTIONS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  attr_reader :color
  include SlidingPiece
  def initialize(color)
    super
  end

  def symbol
    :♜
  end
end

class Bishop < Piece
  MOVES_DIRECTIONS = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  attr_reader :color
  include SlidingPiece
  def initialize(color)
    super
  end

  def symbol
    :♝
  end
end
