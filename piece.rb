class Piece

  def initialize

  end

  def to_s
    'p'
  end

end


class NullPiece < Piece

  def to_s
    ' '
  end

end


class Knight < Piece

  def to_s
    "N"
  end
end

class Bishop < Piece

  def to_s
    "B"
  end
end
