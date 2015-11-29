class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  default_scope { order(:last_name, :first_name) }
  scope :admin, -> { where(admin: true) }
end
