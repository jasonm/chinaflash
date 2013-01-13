class CreateScores < ActiveRecord::Migration
  def up
    create_table :scores do |t|
      t.integer :id
      t.timestamps

      t.integer :matchup_id
      t.integer :student_id
      t.integer :points
    end
  end

  def down
    drop_table :scores
  end
end
