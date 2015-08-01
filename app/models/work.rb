class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_detail
  has_many :work_details

  default_scope { order('created_at DESC') }

  paginates_per 2

  default_value_for :entire_percent, 0
end
