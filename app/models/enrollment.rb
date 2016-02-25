class Enrollment < ActiveRecord::Base
    belongs_to :user, :dependent => :destroy
    belongs_to :course, :dependent => :destroy
    validates :grade, :presence=>true
    # Status can be - enrolled, requested, past
    validates :status, :presence=>true
  
end
