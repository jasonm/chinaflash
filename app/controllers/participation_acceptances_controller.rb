class ParticipationAcceptancesController < ApplicationController
  def new
  end

  def create
    if ! participation
      flash.now[:error] = "Double-check your shortcode?"
      render :new
      return
    else
      flash[:notice] = "Joining as #{student.first_name} #{student.last_name}!"
      participation.connect!
      session[:student_id] = participation.student.id
      redirect_to current_matchup_url
    end
  end

  private

  def shortcode
    params[:participation_acceptance] && params[:participation_acceptance][:shortcode]
  end

  def student
    shortcode && participation.try(:student)
  end

  def participation
    Participation.find_by_shortcode(shortcode)
  end
end
