class DashboardsController < ApplicationController
	before_action :authenticate_player!

#for both games that need a second player and games that can be watched as a spectator
	def show
		# if @current_game.is_joined?
		# 	redirect_to game_path(current_game)
		# else
		# 	redirect_to new_game_path
		# end
	end
	
	helper_method :current_game
	def current_game
		@current_game ||= Game.find(params[:id])
	end

end
