require_relative "piece"

require "colorize"

# puts String.colors
#
# 1/0

class Board
  attr_accessor :grid


  def initialize
    @grid = Array.new(8){Array.new(8)}
    @grid[0].each_with_index do |spot, idx|
      @grid[0][idx] = Piece.new
    end

    @grid[1].each_with_index do |spot, idx|
      @grid[1][idx] = Piece.new
    end

    @grid[6].each_with_index do |spot, idx|
      @grid[6][idx] = Piece.new
    end

    @grid[7].each_with_index do |spot, idx|
      @grid[7][idx] = Piece.new
    end

    [2,3,4,5].each do |row_idx|
      @grid[row_idx].each_with_index do |sq, col_idx|
        @grid[row_idx][col_idx] = NullPiece.new
      end
    end
  end


  def register_cursor(cursor)
    @cursor = cursor
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError
    end
    self[end_pos] = self[start_pos]
    self.[]=(end_pos, self[start_pos])
    self[start_pos] = NullPiece.new
  end

  def in_bounds(pos)
    x, y = pos
    x > -1 && y > -1 && x < 8 && y < 8
  end

  def [](pos)
    unless in_bounds(pos)
      raise ArgumentError  # Perhaps InvalidPositionError ? FixMe
    end
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def to_s
    lines = []
    @grid.each_with_index do |row, r_id|
      line = []
      row.each_with_index do |piece, c_id|
        x, y = @cursor.cursor_pos
        if x == r_id && y == c_id
          line.push(piece.to_s.colorize(:background => :light_cyan))
        else
          line.push(piece.to_s)
        end
      end
      line = line.join(' | ')
      line = '| ' + line + ' |'
      lines.push(line)
    end

    lines = lines.join("\n#{'-'*33}\n")
    lines = ('-' * 33) + "\n" + lines + "\n"  + ('-' * 33)
  end
end
