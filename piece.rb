class Piece
  attr_reader :symbol, :color
  def initialize(color)
    @color = color
  end

  def to_s
    "#{symbol}"
  end

  def color
    @color
  end

  private
  def move_into_check?(to_pos)
  end
end
