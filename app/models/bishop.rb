class Bishop < Piece

  def obstructed_positions(x, y)
    puts "I'm a bishop"
  end

  def legal_move?(x, y)
  # bishop can only move diagonally so easiest condition is to exclude any purely horiz. or vertical moves 
      self.legal_diag_move?(x, y)      
  end

  def obstructed_move?(x, y)
    current_row = self.row_position
    current_col = self.col_position

    # check to see if any piece exists when moving upward and rightward
    if current_row < x && current_col < y
      for i in (current_row+1...x) do
        for j in (current_col+1...y) do
          if self.game.piece_exists?(i, j)
            return true
          end
        end
      end
    end

    # check to see if any piece exists when moving downward and rightward
    if current_row > x && current_col < y
      for i in (x+1...current_row) do
        for j in (current_col+1...y) do
          if self.game.piece_exists?(i, j)
            return true
          end
        end
      end
    end

    # check to see if any piece exists when moving upward and leftward
    if current_row < x && current_col > y
      for i in (current_row+1...x) do
        for j in (y+1...current_col) do
          if self.game.piece_exists?(i, j)
            return true
          end
        end
      end
    end

    # check to see if any piece exists when moving downward and leftward
    if current_row > x && current_col > y
      for i in (x+1...current_row) do
        for j in (y+1...current_col) do
          if self.game.piece_exists?(i, j)
            return true
          end
        end
      end
    end

    false
  end

end