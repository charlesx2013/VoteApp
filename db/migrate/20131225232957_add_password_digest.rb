class AddPasswordDigest < ActiveRecord::Migration
  def up
    add_column :students, :password_digest, :string 
  end

  def down
  end
end
