class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
    validates :grade, :presence=>true
    # Status can be - enrolled, requested, past
    validates :status, :presence=>true
  
end
