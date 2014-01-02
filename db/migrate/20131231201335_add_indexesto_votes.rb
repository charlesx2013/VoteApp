class AddIndexestoVotes < ActiveRecord::Migration
  def up
    add_index :votes, :position_id
    add_index :votes, :candidate_id
    add_index :votes, :student_id
    add_index :candidates, :position_id
  end

  def down
  end
end
