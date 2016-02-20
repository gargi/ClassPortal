class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  has_secure_password
  self.inheritance_column = nil
  has_many :enrollments
  has_many :courses, :through => :enrollments

  def get_all_courses
    current_user.courses
  end

  "Select * from courses as c left join users as u where u.id = c.user_id"
end
