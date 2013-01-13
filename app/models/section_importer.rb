class SectionImporter
  SECTION_SIZE_LIMIT = ENV['SECTION_SIZE_LIMIT'].to_i || 6

  def initialize(api_token, teacher)
    @api_token = api_token
    @teacher = teacher
  end

  def import
    raw_section_hashes.each do |section_hash|
      section = Section.find_or_create_by_name_and_state_id(section_hash['name'], section_hash['id'])

      section_hash['students'].first(SECTION_SIZE_LIMIT).each do |student_hash|
        section.students.find_or_create_by_first_name_and_last_name_and_state_id(
          student_hash['first_name'],
          student_hash['last_name'],
          student_hash['id'])
      end
    end
  end

  private

  def raw_section_hashes
    api = SlcApi.new(@api_token)
    api.sections
    # TODO: Use mult
    api.sections.map do |section|
      {
        'id' => section['id'],
        'name' => section['name'],
        'students' => api.students_for_section(section['id'])
      }
    end
  end
end
