class GamesController < ApplicationController


	def create
		@game = Game.create(game_params)
	end

	def show
		@game = Game.find(params[:id])
	end
	
	private

	def game_params
		params.require(:game).permit(:player_white, :player_black, :player_turn, :winner, :moves)	  
	end

end
