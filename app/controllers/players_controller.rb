class PlayersController < ApplicationController

	def new
	end


	def create
	end


private
# a start to connecting the player_id to a color
# and game since player id is attached to a color in a game
# but it could be a different color in each game
	def player_params
		params.require(:player).permit()

end
