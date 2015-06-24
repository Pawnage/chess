class DashboardsController < ApplicationController
	before_action :authenticate_player!

	def show
		if @game.in_progress?
			redirect_to game_path(@game)
		else
			@game.create
	end


end
