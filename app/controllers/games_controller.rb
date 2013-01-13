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

    # TODO allow to choose
    @game.number_of_rounds = Game::NUMBER_OF_ROUNDS
    @game.interval = Game::ROUND_LENGTH_IN_SECONDS
    @game.cardset = Cardset.first

    if @game.save
      session[:game_id] = @game.id
      redirect_to connecting_game_url(@game)
    else
      @sections = Section.all
      render :new
    end
  end
end
