class ConnectingGamesController < ApplicationController
  def show
    @game = Game.find_by_id!(params[:id])
  end
end
