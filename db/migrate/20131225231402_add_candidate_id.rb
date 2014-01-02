class AddCandidateId < ActiveRecord::Migration
  def up
    add_column :candidates, :candidate_id, :string
  end

  def down
  end
end
