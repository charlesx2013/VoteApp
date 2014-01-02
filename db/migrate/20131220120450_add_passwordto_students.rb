class AddPasswordtoStudents < ActiveRecord::Migration
  def up
    add_column :students, :password, :string
  end

  def down
  end
end
