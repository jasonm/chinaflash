class Game < ActiveRecord::Base
  # has_many :participations
  # has_many :students, through: :participations
  # has_many :rounds

  attr_accessor :section_id
  attr_accessible :section_id
  # belongs_to :section # TODO once Section is an ActiveRecord model

  after_create :create_participations

  def cardset
    [Card.new(), Card.new()]
  end

  private

  def create_participations

  end
end
