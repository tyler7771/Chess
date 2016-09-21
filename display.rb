require_relative 'board'
require 'colorize'
require_relative 'cursor'
require 'byebug'

class Display
  attr_reader :board
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board = board
  end

  def render
    puts "    0  1  2  3  4  5  6  7"
    puts "   ------------------------"
    letters = (0..7).to_a
    @board.grid.each_with_index do |row, row_idx|
      print "#{letters[row_idx]} |"
      row.each_with_index do |el, col_idx|
       if row_idx.even? && col_idx.even? || row_idx.odd? && col_idx.odd?
          print " #{el.to_s.colorize(:color => el.color)} ".colorize(:background => :magenta)
        else
          print " #{el.to_s.colorize(:color => el.color)} ".colorize(:background => :blue)
        end

      end
      puts "\n"
    end
  end
end
