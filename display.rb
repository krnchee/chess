require_relative "cursor.rb"

class Display

  attr_reader :cursor

  def initialize(board)
    @board = board # Educated guess.
    @cursor = Cursor.new([0,0], board)
  end

  def render_and_cursor_test

    while true
      render
      @cursor.get_input
    end
  end

  def render
    system("clear")
    puts @board.to_s
  end

  def move(new_pos)

  end

end
