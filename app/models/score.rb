class Score < ActiveRecord::Base
  belongs_to :matchup
  belongs_to :student

  attr_accessible :points, :matchup_id, :student_id
end
