require_relative 'display'
require_relative 'board'

class Player
  attr_reader :color
  def initialize(name, color)
    @name = name
    @color = color
  end

end

class HumanPlayer < Player
  def initialize(name, color)
    super(name, color)
  end

  def get_starting_position
    puts "What is your starting position?"
    start_pos = gets.chomp
    start_pos.split(",").map(&:to_i)
  end

  def get_ending_position
    puts "Where do you want to move that piece?"
    end_pos = gets.chomp
    end_pos.split(",").map(&:to_i)
  end
end
