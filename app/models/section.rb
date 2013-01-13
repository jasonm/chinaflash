class Section < ActiveRecord::Base
  has_many :students

  attr_accessible :name, :state_id, :students # TODO make secure, this is for seeds and crap
end
