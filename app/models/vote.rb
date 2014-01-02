class Vote < ActiveRecord::Base
  attr_accessible :candidate_id, :student_id, :position_id

  validates :candidate_id, presence: true
  validates :student_id, presence: true 
  validates :position_id, presence: true
  
  belongs_to :position
  belongs_to :student
  belongs_to :candidate

  before_save :check_duplicates
  before_save :check_wrong_grade
  before_save :check_matching_candidate_and_position

  private

    def check_matching_candidate_and_position
      candidate = Candidate.find(self.candidate_id)
      candidate.position.id == self.position_id
    end 
    
    def check_duplicates
      Student.find_by_id(self.student_id).votes.find_by_position_id(self.position_id).nil?
    end

    def check_wrong_grade
      if Position.find_by_id(self.position_id).position_type == "class"
        student = Student.find_by_id(self.student_id)
        candidate = Candidate.find_by_id(self.candidate_id)
        student.grade == candidate.grade
      end
    end

end
