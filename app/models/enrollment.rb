class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :course

validates :grade, :presence=>true

enum status: [:yes, :no]
end
