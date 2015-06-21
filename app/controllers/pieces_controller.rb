class PiecesController < ApplicationController
	def create
		@pieces = current_game.pieces.create(piece_params)
	end

  private

  def current_game
    @current_game ||= Game.find(params[:id])
  end

	def piece_params
		params.require(:piece).permit(:game_id, :row_position, :col_position, :color, :type, :alive, :player_id)	  
	end
end
