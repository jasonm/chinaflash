class ConvertStateIdsToString < ActiveRecord::Migration
  def up
    change_column :sections, :state_id, :string, limit: 256
    change_column :students, :state_id, :string, limit: 256
  end

  def down
    change_column :students, :state_id, :integer
    change_column :sections, :state_id, :integer
  end
end
