class Piece

  def initialize

  end

  def to_s()
    return "♜"
  end

  def empty?()
  end

  def symbol()
  end

  def valid_moves(start_pos)
    #start_pos is Nullpiece
    #piece can't move to end_pos
  end

  private
  def move_into_check?(to_pos)
  end
end
