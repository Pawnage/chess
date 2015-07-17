class PiecesController < ApplicationController
	def create
		@pieces = current_game.pieces.create(piece_params)
	end

  def show
    @selected_piece = Piece.find(params[:id])
    @pieces = @selected_piece.game.pieces
    render :template => "games/show"
  end

  def update
    @piece = Piece.find(params[:id])
    row = params[:row_position]
    col = params[:col_position]
    @piece.capture!(row, col) if @piece.capturable?(row, col)
    @piece.update_attributes(:row_position => row, :col_position => col)
     #to be moved once obstructed, legal and valid are combined as checks into one method 
      # if @piece.update_attributes(:row_position => row, :col_position => col).legal_move?
      #   redirect_to game_path(@piece.game)
      # end
  end

  private

  def current_game
    @current_game ||= Game.find(params[:id])
  end

	def piece_params
		params.require(:piece).permit(:game_id, :row_position, :col_position, :color, :type, :alive, :player_id)	  
	end
end
