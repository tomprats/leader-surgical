class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  before_validation :format_email

  default_scope { order(:last_name, :first_name) }
  scope :admin, -> { where(admin: true) }

  def name
    "#{first_name} #{last_name}"
  end

  private
  def format_email
    self.email = self.email.strip.downcase
  end
end
