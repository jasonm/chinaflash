class AddGamesSectionId < ActiveRecord::Migration
  def up
    add_column :games, :section_id, :integer
  end

  def down
    remove_column :games, :section_id
  end
end
