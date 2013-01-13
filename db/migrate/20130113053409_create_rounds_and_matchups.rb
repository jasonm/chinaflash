class CreateRoundsAndMatchups < ActiveRecord::Migration
  def up
    create_table :rounds do |t|
      t.integer :id
      t.timestamps

      t.integer :game_id
      t.integer :round_number
    end

    create_table :matchups do |t|
      t.integer :id
      t.timestamps

      t.integer :round_id
      t.integer :card_id

      t.integer :student1_id
      t.integer :student2_id
    end
  end

  def down
    drop_table :matchups

    drop_table :rounds
  end
end
