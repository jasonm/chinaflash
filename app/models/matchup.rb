class Matchup < ActiveRecord::Base
  belongs_to :student1, class_name: 'Student'
  belongs_to :student2, class_name: 'Student'
  belongs_to :card
  belongs_to :round

  attr_accessible :student1, :student2, :card
end
