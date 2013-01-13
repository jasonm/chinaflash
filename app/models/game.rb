class Game < ActiveRecord::Base
  has_many :participations
  has_many :students, through: :participations
  # has_many :rounds
  belongs_to :section
  belongs_to :cardset

  attr_accessible :section_id

  after_create :create_participations

  def all_connected?
    participations.all?(&:connected?)
  end

  private

  def create_participations
    section.students.each do |student|
      participations.create(student: student)
    end
  end
end
