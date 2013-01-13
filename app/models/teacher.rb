class Teacher < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid
  
  def self.create_with_omniauth(auth)
    create! do |teacher|
      teacher.provider = auth["provider"]
      teacher.uid = auth["uid"]
      teacher.name = auth["info"]["name"]
    end
  end
end
