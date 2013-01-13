class GamesController < ApplicationController
  def new
    if !current_teacher
      redirect_to '/auth/slc'
      return
    end

    @sections = Section.all
    @game = Game.new
  end

  def create
    @game = Game.create(params[:game])
    redirect_to connecting_game_url(@game)
  end
end
