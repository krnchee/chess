module Slideable

  def moves

    possibles = []
    orig_pos = @pos.dup

    if @move_dirs.include?(:ortho)
      offsets = [[0,1], [0,-1], [1,0], [-1,0]]
      possibles.concat(get_vectors(offsets))
    end

    if @move_dirs.include?(:diag)
      offsets = [[1,1], [1,-1], [-1,1], [-1,-1]]
      possibles.concat(get_vectors(offsets))
    end

    possibles
  end

  def get_vectors(offsets)
    possibles = []

    offsets.each do |offset|

      cur_x, cur_y = @pos
      x_diff, y_diff = offset
      enemy_found = false
      new_candidate = [cur_x + x_diff, cur_y + y_diff]

      while @board.in_bounds(new_candidate)

        break if enemy_found

        if [:w, :b].include?(@board[new_candidate].color)
          if @board[new_candidate].color == @color
            break
          else
            enemy_found = true
            possibles.push(new_candidate)
          end
        else
          possibles.push(new_candidate)
        end

        new_candidate = [new_candidate.first + x_diff,
                         new_candidate.last + y_diff]
      end
    end
    possibles
  end

end
