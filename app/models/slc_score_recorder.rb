class SlcScoreRecorder
  def initialize(token, game, logger = Rails.logger)
    @token = token
    @game = game
    @logger = logger
  end

  def record_scores
    @game.participations.each do |participation|
      student = participation.student
      points = @game.scores.select { |score| score.student == student }.map(&:points).sum
      new_data = {
        game_number: @game.id,
        points: points,
        game_started_at: @game.started_at
      }

      @logger.info("Sending student info for #{student.full_name} (#{student.state_id}): #{new_data.to_json}")

      api.set_custom_for_student(student.state_id, new_data)
    end
  end

  private

  def api
    SlcApi.new(@token)
  end
end
