class SectionImporter
  SECTION_SIZE_LIMIT = ENV['SECTION_SIZE_LIMIT'] || 6

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

  class SlcApi
    def initialize(token)
      @token = token
    end

    def results(url = 'https://api.sandbox.slcedu.org/api/rest/v1/', verb = :get)
      headers = { "Accept" => 'application/vnd.slc+json',
        "Content-Type" => 'application/vnd.slc+json',
        "Authorization" => "bearer #{@token}" }

      response = HTTParty.send(verb.to_sym, url, :headers => headers)
      JSON.parse(response.body)
    end

    def sections
      sections_url = results['links'].detect { |link| link['rel'] == 'getSections' }['href']
      results(sections_url).map { |section_hash|
        {
          'name' => section_hash['uniqueSectionCode'],
          'id' => section_hash['id']
        }
      }
    end

    def students_for_section(section_id)
      students_url = "https://api.sandbox.slcedu.org/api/rest/v1/sections/#{section_id}/studentSectionAssociations/students"
      results(students_url)
      results(students_url).map { |student_hash|
        {
          'first_name' => student_hash['name']['firstName'],
          'last_name' => student_hash['name']['lastSurname'],
          'state_id' => student_hash['id']
        }
      }.flatten
    end
  end
end
