class CreateParticipations < ActiveRecord::Migration
  def up
    create_table :participations do |t|
      t.integer :id
      t.integer :game_id
      t.integer :student_id
      t.string :shortcode
      t.datetime :connected_at
      t.timestamps
    end
  end

  def down
    drop_table :participations
  end
end
