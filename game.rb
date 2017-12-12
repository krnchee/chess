require_relative "board"
require_relative "display"

class Game

  attr_reader :display

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @board.register_cursor(@display.cursor)
  end

end

g=Game.new
g.display.render_and_cursor_test
