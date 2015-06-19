class PiecesController < ApplicationController


	def create
		@piece = game.pieces.create(piece_params)
	end

private

	def piece_params
		params.require(:piece).permit(:game_id, :piece_type, :color, :row_position, :col_position)	  
	end

end
