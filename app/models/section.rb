class Section
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id, :name, :state_id, :students

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.all
    [
      Section.new({
        id: 1,
        name: 'Chinese 101',
        state_id: 1001,
        students: [
          Student.new(first_name: 'Jason', last_name: 'Morrison', id: 1, state_id: 2001),
          Student.new(first_name: 'John',  last_name: 'Cumbers',  id: 2, state_id: 2002)
        ]
      }),

      Section.new({
        id: 2,
        name: 'Chinese 202',
        state_id: 1002,
        students: [
          Student.new(first_name: 'Amy',   last_name: 'Appleton',  id: 3, state_id: 2003),
          Student.new(first_name: 'Billy', last_name: 'Bobberton', id: 4, state_id: 2004)
        ]
      })
    ]
  end
end
