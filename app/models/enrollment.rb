class Enrollment < ActiveRecord::Base
    belongs_to :student
    belongs_to :course

validates :grade, :presence=>true

enum status: [:yes, :no]
end
