class Game < ActiveRecord::Base
  has_many :participations
  has_many :students, through: :participations
  # has_many :rounds
  belongs_to :section

  attr_accessible :section_id

  after_create :create_participations

  def cardset
    [Card.new(), Card.new()]
  end

  private

  def create_participations

  end
end
