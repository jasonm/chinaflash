class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    session[:token] = auth[:credentials][:token]
    teacher = Teacher.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Teacher.create_with_omniauth(auth)
    SectionImporter.new(session[:token], teacher).import
    session[:teacher_id] = teacher.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:teacher_id] = nil
    session[:token] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
