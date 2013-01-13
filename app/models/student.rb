class Student < ActiveRecord::Base
  belongs_to :section
  attr_accessible :name, :state_id, :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end
