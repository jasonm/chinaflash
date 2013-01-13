class ScoreboardsController < ApplicationController
  def show
    if current_game.game_over?
      if current_game.finished?
        # great!
      else
        current_game.finish!
        SlcScoreRecorder.new(session[:token], current_game).record_scores
      end
    end
  end
end
