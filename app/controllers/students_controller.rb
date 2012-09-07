class StudentsController < ApplicationController
  
  def index
    def slc_request
      if current_user
        path = 'https://api.sandbox.slcedu.org/api/rest/v1/students'
        headers = { "Accept" => 'application/vnd.slc+json',
                      "Content-Type" => 'application/vnd.slc+json',
                      "Authorization" => "bearer #{session[:token]}" }

        @slc_request = HTTParty.send(request.method.underscore.to_sym, path, :headers => headers)
      end
    end
  end
  
end