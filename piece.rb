
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

  def moves
    x, y = @pos
    possible_moves =  []
    [-1 , 0, 1].each do |x_diff|
      [-1, 0, 1].each do |y_diff|
        possible_moves << [(x + x_diff), (y + y_diff)]
      end
    end
    possible_moves.select! { |pm| @board.in_bounds(pm) }
    possible_moves.reject! do |pm|
      @board[pm].color == @color
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

  def moves
    x, y = @pos
    possible_moves = []
    [-1,-2,1,2].each do |x_diff|
      [-1,-2,1,2].each do |y_diff|
        next if x_diff.abs == y_diff.abs
        possible_moves << [(x + x_diff), (y + y_diff)]
      end
    end
    possible_moves.select! { |pm| @board.in_bounds(pm) }
    possible_moves.reject! do |pm|
      @board[pm].color == @color
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
