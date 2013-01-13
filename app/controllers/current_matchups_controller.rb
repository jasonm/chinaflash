class CurrentMatchupsController < ApplicationController
  def show
    render text: "MATCHUP as #{current_student.full_name}"
  end
end
