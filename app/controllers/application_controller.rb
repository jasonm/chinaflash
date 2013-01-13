class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_teacher, :signed_in?

  private

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def signed_in?
    !!current_teacher
  end

end
