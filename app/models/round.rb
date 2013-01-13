class Round < ActiveRecord::Base
  attr_accessible :round_number
  has_many :matchups
  belongs_to :game
end
