class Student < ActiveRecord::Base
  attr_accessible :asb_vote, :class_vote, :grade, :name, :student_id, :password

  has_secure_password
  validates_presence_of :student_id, message: "ID can't be blank"
  validates_uniqueness_of :student_id, message: "ID has already been taken"
  validates_length_of :student_id, is: 8, message: "ID must be 8 numbers"
  validates :password, presence: true, length: { is: 6 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :grade, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }

  has_many :votes, foreign_key: "student_id"
  has_many :candidates, through: :votes

  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
