class StudentsController < ApplicationController
  def index
    path = 'https://api.sandbox.slcedu.org/api/rest/v1/students'
    headers = { "Accept" => 'application/vnd.slc+json',
      "Content-Type" => 'application/vnd.slc+json',
      "Authorization" => "bearer #{session[:token]}" }

    @slc_request = HTTParty.send(request.method.underscore.to_sym, path, :headers => headers)
  end
end
