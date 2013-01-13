require 'digest'

class Participation < ActiveRecord::Base
  belongs_to :game
  belongs_to :student

  attr_accessible :game, :student

  before_validation :set_shortcode, on: :create

  def connected?
    connected_at.present?
  end

  def connect!
    self.connected_at = Time.now
    save!
  end

  private

  def set_shortcode
    self.shortcode = (1..4).map { (1..9).to_a.shuffle.first.to_s }.shuffle.join
  end
end
