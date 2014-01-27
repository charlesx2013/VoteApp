class Candidate < ActiveRecord::Base
  attr_accessible :grade, :name, :position_id, :candidate_id
  
  validates :position_id, presence: true
  validates :grade, presence: true
  validates_presence_of :position_id, message: "ID can't be blank"
  validates_presence_of :candidate_id, message: "ID can't be blank"
  validates_length_of :candidate_id, is: 8, message: "ID must be 8 numbers"
  validates_uniqueness_of :candidate_id, message: "ID has already been taken!"


  has_many :votes, foreign_key: "candidate_id"
  has_many :students, through: :votes

  belongs_to :position

  def percentage
    num = self.votes.length
    num ||= 0
    denom = Vote.where(position_id: self.position_id).length
    denom = 10 if denom == 0
    return "#{(num/denom) * 100}%"
  end
end
