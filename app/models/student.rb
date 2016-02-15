class Student < ActiveRecord::Base
  has_many :courses
  validates :name, :presence=>true
  validates :email, :presence=>true
  validates :password, :presence=>true
end
