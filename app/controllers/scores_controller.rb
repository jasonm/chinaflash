class ScoresController < ApplicationController
  def create
    score = Score.create(params[:score])
    flash[:notice] = 'Great!'
    redirect_to current_matchup_url
  end
end
