class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :students, :password_digest
  end

  def down
  end
end
