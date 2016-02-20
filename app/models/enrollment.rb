class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :course

<<<<<<< HEAD
    validates :grade, :presence=>true
    validates :status, :presence=>true
  
=======
validates :grade, :presence=>true
>>>>>>> ptrived
end
