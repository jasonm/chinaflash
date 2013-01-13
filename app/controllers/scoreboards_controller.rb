class ScoreboardsController < ApplicationController
  def show
    if current_game.game_over?
      current_game.finish!
    end
  end
end
