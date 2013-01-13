class SlcApi
  def initialize(token)
    @token = token
  end

  def results(url = 'https://api.sandbox.slcedu.org/api/rest/v1/', verb = :get, body = nil)
    headers = { "Accept" => 'application/vnd.slc+json',
      "Content-Type" => 'application/vnd.slc+json',
      "Authorization" => "bearer #{@token}" }

    response = HTTParty.send(verb.to_sym, url, :headers => headers, :body => body)

    JSON.parse(response.body) rescue nil
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

  def custom_for_student(student_id)
    custom_url = "https://api.sandbox.slcedu.org/api/rest/v1/students/#{student_id}/custom"
    results(custom_url)
  end

  def set_custom_for_student(student_id, new_data_hash)
    custom_url = "https://api.sandbox.slcedu.org/api/rest/v1/students/#{student_id}/custom"
    body = new_data_hash.to_json

    if not_found(custom_for_student(student_id))
      results(custom_url, :post, body)
    else
      # TODO: Eventually, fetch & append; for now, just overwrite.
      results(custom_url, :put, body)
    end
  end

  def not_found(response_hash)
    response_hash['code'] && response_hash['code'] == 404
  end
end

