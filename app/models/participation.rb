require 'digest'

class Participation < ActiveRecord::Base
  belongs_to :game
  belongs_to :student

  attr_accessible :game, :student

  before_validation :set_shortcode, on: :create

  private

  def set_shortcode
    self.shortcode = Digest::MD5.hexdigest(Time.now.to_f.to_s + student_id.to_s + game_id.to_s + "salt")[0..5].upcase
  end
end
