class GamesController < ApplicationController
  def new
    if !current_teacher
      redirect_to '/auth/slc'
      return
    end

    # this is for teachers
    # if not oauthed, redirect through omniauth-slc
  end
end
