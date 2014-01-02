class AddRememberToken < ActiveRecord::Migration
  def up
    add_column :students, :remember_token, :string
    add_index :students, :remember_token
  end

  def down
  end
end
