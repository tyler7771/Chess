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

  def move(new_pos)
  end

  def render
    puts "    0  1  2  3  4  5  6  7"
    puts "   ------------------------"
    # ("a".."h").to_a.each_with_index do |letter, idx|
      # debugger
      #  "#{row} | #{@board.grid[idx]}"
      letters = ("a".."h").to_a
    @board.grid.each_with_index do |row, row_idx|
      print "#{letters[row_idx]} |"
      row.each_with_index do |el, col_idx|
       if row_idx.even? && col_idx.even? || row_idx.odd? && col_idx.odd?
          print " #{el.to_s.colorize(:color => :red)} ".colorize(:background => :white)
        else
          print " #{el.to_s.colorize(:color => :black)} ".colorize(:background => :yellow)
        end

      end
      puts "\n"
    end
  end
end

b = Board.new
d = Display.new(b)
d.render
