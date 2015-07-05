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
    @piece.update_attributes(:row_position => row, :col_position => col)
      if @piece.type == 'Pawn' 
        #add line that detects when the attribute update results in a two-square move by the pawn
        
        #calls method that overrides the standard legal move method and sets legal_move? = true so
        # that legal_move can be called on the pawn for all future moves as with the other pieces. 
        @piece.game.move_two_squares?
        if piece.update_attributes(:row_position => row, :col_position => col).legal_move?
        redirect_to game_path(@piece.game)
      #for when legal_move? returns false, player must retract move and make a new move  
      else @piece.update_attributes(:row_position => :col_position => col)
      end
  end

  private

  def current_game
    @current_game ||= Game.find(params[:id])
  end

	def piece_params
		params.require(:piece).permit(:game_id, :row_position, :col_position, :color, :type, :alive, :player_id)	  
	end
end
