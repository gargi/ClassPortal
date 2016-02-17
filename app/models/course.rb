class Course < ActiveRecord::Base
  belongs_to :instructor

  has_many :students

  validates :course_number, :presence=>true
  validates :title, :presence=>true
  validates :description, :presence=>true
  validates :start_date, :presence=>true
  validates :end_date, :presence=>true
  validates :status, :presence=>true
  validates :instructor, :presence=>true

  enum status: [:active, :inactive]

end
