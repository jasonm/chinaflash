class CurrentMatchupsController < ApplicationController
  def show
    if current_game.game_over?
      render 'game_over'
    elsif current_game.current_round
      @matchup = matchup
      @other_student = other_student
    end
  end

  private

  def other_student
    both = [matchup.student1, matchup.student2]
    [both - [current_student]].flatten.first
  end

  def matchup
    current_game.matchup_for_student(current_student)
  end
end
