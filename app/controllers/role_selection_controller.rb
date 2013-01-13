class RoleSelectionController < ApplicationController
  def show
    if current_teacher
      redirect_to new_game_url
      return
    end
  end
end
