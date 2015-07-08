class GamesController < ApplicationController
  before_action :authenticate_player!, :only => [:new, :create]

  	def index
  		@games = Game.all.to_a.select { |g| !g.is_joined? }
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
	  @pieces = @game.pieces

	  if params[:piece_id]
	  	@selected_piece = Piece.find(params[:piece_id])
	  end

	  respond_to do |format|
	  	format.html { render :show}
	  	format.js {}
	  end
	end

	def update

	  if params[:piece][:row_position] && params[:piece][:col_position] && params[:piece][:selected_piece_id]
	  	@selected_piece = Piece.find(params[:piece][:selected_piece_id])
	  	@row = params[:piece][:row_position]
	  	@col = params[:piece][:col_position]
	  end


	  if @selected_piece && @row && @col
	  	@selected_piece.update_attributes(:row_position => @row, :col_position => @col)
	  end

	  respond_to do |format|
	  	format.html { render :show }
	  	format.json { render 'update.js.erb'}
	  end
	end
	
	private

	def current_game
		@current_game ||= Game.find(params[:id])
	end

	def game_params
		params.require(:game).permit(:player_white_id, :player_black_id, :player_turn, :winner, :moves,
							 :row_position, :col_position, :selected_piece_id)	  
	end
end
