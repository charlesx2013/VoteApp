class Position < ActiveRecord::Base
  attr_accessible :name, :position_type

  VALID_REGEX = /(asb|class)/
  validates :name, presence: true
  validates :position_type, presence: true, format: { with: VALID_REGEX }

  has_many :candidates, foreign_key: "position_id"
  has_many :votes, foreign_key: "position_id"

  def winner
    votes = 0
    winner = nil
    candidates = self.candidates
    candidates.each do |candid|
      if candid.votes.length > votes
        winner = candid
        votes = candid.votes.length
      end
    end
    return winner
  end

end
