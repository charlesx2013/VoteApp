class AddMoreColunns < ActiveRecord::Migration
  def up
    add_column :candidates, :position_id, :string
    remove_column :candidates, :position_type
  end

  def down
  end
end
