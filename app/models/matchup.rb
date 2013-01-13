class Matchup < ActiveRecord::Base
  belongs_to :student1, class_name: 'Student'
  belongs_to :student2, class_name: 'Student'
  belongs_to :card
  belongs_to :round

  def self.for_student(student)
    self.where(student1_id: student).first || self.where(student2_id: student).first
  end
end
