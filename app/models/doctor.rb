class Doctor < ActiveRecord::Base
  belongs_to :specialty, class_name: "Service"

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :first_name, scope: :last_name, message: "must be unique"

  default_scope { order(:last_name, :first_name) }
  scope :active, -> { where(active: true) }

  def name
    "#{first_name} #{last_name}"
  end
end
