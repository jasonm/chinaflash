class Student
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id, :first_name, :last_name, :state_id

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
