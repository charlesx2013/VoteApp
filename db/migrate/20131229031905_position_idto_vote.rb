class PositionIdtoVote < ActiveRecord::Migration
  def up
    add_column :votes, :position_id, :string
  end

  def down
  end
end
