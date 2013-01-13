class ScoreboardsController < ApplicationController
  def show
    render text: "Game #{current_game.id} is in play!  (Scoreboard here)"
  end
end
