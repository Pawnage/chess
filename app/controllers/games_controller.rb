class GamesController < ApplicationController
  before_action :authenticate_player!, :only => [:new, :create]

  	def index
  		@games = Game.all
  	end

  	def new
  		@game = Game.new
  	end


	def create
		@game = Game.create(:player_white_id => current_player.id, :player_black_id => nil, :player_turn => current_player.id, :winner => nil, :moves => 0)
		redirect_to game_path(@game)
	end

	def show
		@game = Game.find(params[:id])
	end
	
	private

	def game_params
		params.require(:game).permit(:player_white_id, :player_black_id, :player_turn, :winner, :moves)	  
	end
end
