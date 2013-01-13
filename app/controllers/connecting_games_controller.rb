class ConnectingGamesController < ApplicationController
  def show
    @game = Game.find_by_id!(params[:id])

    if @game.all_connected?
      redirect_to scoreboard_url(@game)
    end
  end
end
