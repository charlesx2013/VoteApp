class ChangeNameColumns < ActiveRecord::Migration
  def up
    remove_column :positions, :type
    remove_column :candidates, :type
    add_column :positions, :position_type, :string
    add_column :candidates, :position_type, :string
    
  end

  def down
  end
end
