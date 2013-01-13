class Game < ActiveRecord::Base
  NUMBER_OF_ROUNDS = 5
  ROUND_LENGTH_IN_SECONDS = 13

  has_many :participations
  has_many :students, through: :participations
  has_many :rounds
  belongs_to :section
  belongs_to :cardset

  attr_accessible :section_id

  after_create :create_others

  validate :enough_cards_for_students

  def scores
    rounds.map { |r| r.matchups }.flatten.map { |m| m.scores }.flatten
  end

  def matchup_for_student(student)
    if round = current_round
      round.matchups.where(student1_id: student).first || round.matchups.where(student2_id: student).first
    end
  end

  def game_over?
    started? && current_round_number.present? && current_round_number > self.number_of_rounds
  end

  def current_round
    if started?
      round = rounds.find_by_round_number(current_round_number)
    else
      nil
    end
  end

  def current_round_number
    if started?
      elapsed_time = Time.now - self.started_at
      round_number = (elapsed_time / ROUND_LENGTH_IN_SECONDS).to_i
    else
      0
    end
  end

  def all_connected?
    participations.all?(&:connected?)
  end

  def start!
    self.started_at = Time.now
    save!
  end

  def finish!
    self.finished_at = Time.now
    save!
    annul_participation_shortcodes
  end

  def finished?
    finished_at.present?
  end

  def started?
    started_at.present?
  end

  private

  def enough_cards_for_students
    if cardset.cards.count < section.students.count / 2
      errors[:base] << "#{cardset.cards.count} is not enough cards to match up #{section.students.count} students into #{section.students.count / 2} pairs"
    end
  end

  def create_others
    create_participations
    create_rounds
    create_matchups
  end

  def create_participations
    section.students.each do |student|
      participations.create(student: student)
    end
  end

  def create_rounds
    NUMBER_OF_ROUNDS.times do |time|
      rounds.create(round_number: time + 1)
    end
  end

  def create_matchups
    rounds.each do |round|
      deck = cardset.cards.shuffle
      students.shuffle.in_groups_of(2) do |student_pair|
        card = deck.pop
        student1, student2 = student_pair

        round.matchups.create(student1: student1, student2: student2, card: card)
      end
    end
  end

  def annul_participation_shortcodes
    participations.each do |participation|
      participation.shortcode = nil
      participation.save!
    end
  end
end
