class Admin < ActiveRecord::Base
  attr_accessible :birthdate, :name, :password, :student_id, :password_confirmation
  
  has_secure_password

  validates :birthdate, length: { is: 6 }, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :student_id, presence: true, length: { is: 8 }
  validates_uniqueness_of :student_id, message: "ID has already been taken"

  after_validation { self.errors.messages.delete(:password_digest) }

  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
