class Cardset < ActiveRecord::Base
  has_many :cards
  has_many :games

  attr_accessible :cards, :name # TODO secure
end
