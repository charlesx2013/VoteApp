class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :grade
      t.string :position
      t.string :type

      t.timestamps
    end
  end
end
