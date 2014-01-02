class RemovePassword < ActiveRecord::Migration
  def up
    remove_column :students, :password
  end

  def down
  end
end
