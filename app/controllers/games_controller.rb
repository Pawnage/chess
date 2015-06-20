class GamesController < ApplicationController

  def index
  	@games = Game.all
  end

	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
		redirect_to game_path(@game)
	end

	def show
		@game = Game.find(params[:id])
	end
	
	private

	def game_params
		params.require(:game).permit(:player_white, :player_black, :player_turn, :winner, :moves)	  
	end

end
