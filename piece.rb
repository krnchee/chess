
require_relative 'slideable'
require 'singleton'


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
  include Singleton

  def initialize
#    @board = board
    @color = :null
  end

  def to_s
    ' '
  end

end


class Bishop < Piece
  include Slideable

  def initialize(color, pos, board)
    @move_dirs = [:diag]
    super
  end



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

  def moves
    x, y = @pos
    possible_moves = []
    direction = @color == :w ? -1 : 1

    if x == 1 || x == 6
      possible_moves << [x + 2* direction, y]
    end
    possible_moves << [x + direction, y]

    [1, -1].each do |y_diff|
      candidate = @board[x + direction, y + y_diff]
      unless candidate.is_a?(NullPiece) || candidate.color == @color
       possible_moves << [x + direction, y + y_diff]
      end
    end
    possible_moves.select! { |pm| @board.in_bounds(pm) }
  end
end


class Queen < Piece
  include Slideable

  def initialize(color, pos, board)
    @move_dirs = [:diag, :ortho]
    super
  end

  def to_s
    if @color == :b
      '♛' #black
    elsif @color == :w
      '♕'
    end
  end
end


class Rook < Piece
  include Slideable

  def initialize(color, pos, board)
    @move_dirs = [:ortho]
    super
  end



  def to_s
    if @color == :b
      '♜' #black
    elsif @color == :w
      '♖'
    end
  end
end
