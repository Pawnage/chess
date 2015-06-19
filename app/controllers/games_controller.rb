class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
	end

	private

	def game_params
		params.require(:game).permit(:player_white, :player_black, :player_turn, :winner, :moves)
		  
	end



end
