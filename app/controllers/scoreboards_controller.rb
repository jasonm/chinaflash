class ScoreboardsController < ApplicationController
  def show
    if params[:round_number].to_i != current_game.current_round_number
      redirect_to scoreboard_url(round_number: current_game.current_round_number, play_gong: true)
      return
    end

    if current_game.game_over?
      if current_game.finished?
        # great!
      else
        current_game.finish!
        SlcScoreRecorder.new(session[:token], current_game).record_scores
        flash.now[:notice] = 'Recorded scores to SLC.'
      end
    end
  end
end
