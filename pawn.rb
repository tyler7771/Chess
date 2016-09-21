class Pawn < Piece
  attr_reader :color
  def initialize(color)
    super(color)
  end

  def symbol
    :♟
  end

  def moves()
  end

  def at_start_row?()
  end

  def forward_dir()
  end

  def forward_steps()
  end

  def side_attacks()
  end
end
