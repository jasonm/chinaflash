class CurrentMatchupsController < ApplicationController
  def show
    @matchup = matchup
    @other_student = other_student
  end

  private

  def other_student
    both = [matchup.student1, matchup.student2]
    [both - [current_student]].flatten.first
  end

  def matchup
    Matchup.for_student(current_student)
  end
end
