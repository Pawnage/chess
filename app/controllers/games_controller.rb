class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def game_params
		params.require(:game).permit(:player_white, :player_black, :player_turn, :winner, :moves)
	end

	def current_game
		@game = Game.find(params[:id])
	end
end
