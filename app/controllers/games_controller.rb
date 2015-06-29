class GamesController < ApplicationController
  before_action :authenticate_player!, :only => [:new, :create]

  def index
  	@games = Game.all
  end


	def create
		@game = Game.create(:player_white => current_player.id, :player_black => nil, :player_turn => current_player.id, :winner => nil, :moves => 0)
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
