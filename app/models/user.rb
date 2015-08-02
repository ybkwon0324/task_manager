class User < ActiveRecord::Base
  has_many :works
  has_many :work_details, through: :works

  default_scope { order('created_at DESC') }

  before_save { self.email = email.downcase }
  default_value_for :point, 0

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :point, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
