
require 'singleton'
class NullPiece
  include Singleton

  def instance

  end

  def color
  end

  def to_s
    "#{symbol}"
  end

  def symbol
    " "
  end

  def move_dirs()
  end
end
