class WorkDetail < ActiveRecord::Base
  has_many :works

  default_scope { order('created_at DESC') }

  default_value_for :completion, false
end
