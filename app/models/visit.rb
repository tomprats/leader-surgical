class Visit < ApplicationRecord
  mount_uploader :file, FileUploader

  acts_as_forest order: :rank

  validates_presence_of :rank, :name
  validates_uniqueness_of :name, scope: :parent_id, message: "is already taken"

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }
end
