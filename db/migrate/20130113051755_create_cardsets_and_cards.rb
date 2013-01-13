class CreateCardsetsAndCards < ActiveRecord::Migration
  def up
    create_table :cardsets do |t|
      t.integer :id
      t.timestamps

      t.string :name
    end

    create_table :cards do |t|
      t.integer :id
      t.timestamps

      t.integer :cardset_id
      t.string :image_url
      t.string :hint_text
      t.string :answer_text
    end

    add_column :games, :cardset_id, :integer
  end

  def down
    remove_column :games, :cardset_id

    drop_table :cards

    drop_table :cardsets
  end
end
