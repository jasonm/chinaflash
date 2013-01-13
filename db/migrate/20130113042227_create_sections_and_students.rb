class CreateSectionsAndStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.integer :state_id
      t.integer :section_id
      t.timestamps
    end

    create_table :sections do |t|
      t.integer :id
      t.string :name
      t.integer :state_id
      t.timestamps
    end
  end

  def down
    drop_table :sections
    drop_table :students
  end
end
