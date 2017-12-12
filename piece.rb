
class Piece
  attr_reader :color

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    'P'

  end

end


class NullPiece < Piece

  def initialize(board)
    @board = board
    @color = :null
  end

  def to_s
    ' '
  end

end


class Bishop < Piece

  def to_s
    if @color == :b
      '♝' #black
    elsif @color == :w
      '♗'
    end
  end
end


class King < Piece

  def to_s
    if @color == :b
      '♚' #black
    elsif @color == :w
      '♔'
    end
  end



end


class Knight < Piece

  def to_s
    if @color == :b
      '♞' #black
    elsif @color == :w
      '♘'
    end
  end
end


class Pawn < Piece

  def to_s
    if @color == :b
      '♟' #black
    elsif @color == :w
      '♙'
    end
  end
  # white pawn♙
end


class Queen < Piece

  def to_s
    if @color == :b
      '♛' #black
    elsif @color == :w
      '♕'
    end
  end
end


class Rook < Piece

  def to_s
    if @color == :b
      '♜' #black
    elsif @color == :w
      '♖'
    end
  end
end
