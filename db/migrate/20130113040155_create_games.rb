class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.integer :interval
      t.integer :number_of_rounds

      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end

  def down
    drop_table :games
  end
end
