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
    @game = Game.new(params[:game])
    @game.cardset = Cardset.first # TODO allow to choose

    if @game.save
      session[:game_id] = @game.id
      redirect_to connecting_game_url(@game)
    else
      render :new
    end
  end
end
