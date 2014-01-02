class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :grade
      t.string :student_id
      t.string :password_digest
      t.boolean :class_vote
      t.boolean :asb_vote

      t.timestamps
    end
  end
end
