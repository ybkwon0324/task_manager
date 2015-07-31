class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_detail
  has_many :work_details
end
