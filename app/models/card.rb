class Card < ActiveRecord::Base
  belongs_to :cardset
  attr_accessible :image_url, :hint_text, :answer_text
end
