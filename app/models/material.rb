class Material < ActiveRecord::Base
  belongs_to :course
  validates :content, :presence => true
end
