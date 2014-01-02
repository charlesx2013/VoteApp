class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :student_id
      t.string :birthdate
      t.string :password_digest

      t.timestamps
    end
  end
end
