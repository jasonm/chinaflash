class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_teacher, :signed_in?, :current_student, :current_game

  private

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def signed_in?
    !!current_teacher
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def current_game
    @current_game ||= Game.find(session[:game_id]) if session[:game_id]
  end
end
