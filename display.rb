require_relative "cursor.rb"

class Display

  def initialize(board)
    @board = board # Educated guess.
    @cursor = Cursor.new([0,0], board)
  end

  def render
    lines = []
    @board.
  end

  def move(new_pos)

  end

end
