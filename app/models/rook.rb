class Rook < Piece
  def obstructed_move?(x, y)
    current_row = self.row_position
    current_col = self.col_position

    # check if a piece is blocking the path in the first vertical direction
    # if y is the same column as current column and x is larger than the current_row
    if current_col == y && x > current_row
      # for each row from current_row + 1 to (x - 1) in current_column check if a piece exists
      for i in (current_row+1...x) do
        # if it does return true
        if self.game.piece_exists?(i, y)
          return true
        end	
      end
    end

    # check if a piece is blocking the path in the second vertical direction
    if current_col == y && x < current_row
      # puts "second vertical"
      # for each row from (x + 1) to current_row - 1 in current_column check if a piece exists
      for i in (x+1...current_row) do
        # if it does return true
        if self.game.piece_exists?(i, y)
          return true
        end	
      end
    end

    # check if a piece is blocking the path in the first horizontal direction
    # if x is the same row and current_row and y is larger than current_column
    if current_row == x && y > current_col
      # puts "first horizontal"
      # for each column from current_col + 1 to (y - 1) in current_row check if a piece exists
      for i in (current_col+1...y) do
        # if it does return true
        if self.game.piece_exists?(x, i)
          return true
        end	
      end
    end

    # check if a piece is blocking the path in the second horizontal direction
    if current_row == x && y < current_col
      # puts "second horizontal"
      # for each column from (y + 1) to current_col - 1 in current_row check if a piece exists
      for i in (y+1...current_col) do
        # if it does return true
        if self.game.piece_exists?(x, i)
          return true
        end	
      end
    end

    return false
  end

# def obstructed_positions(x, y)
#   puts "I'm a rook"
# end

# def legal_move?(x, y)
#   # rook's move is purely horizontal or vertical
#   if (self.row_position - x) == 0 or (self.col_position - y) == 0 
#     # add conditions for kingside and queenside castling (i.e. rook moves horizontally (or vertically?) around king or queen)
#     return true
#   else
#     return false
#   end
# end  
end