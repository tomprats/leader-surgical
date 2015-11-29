class Procedure < ActiveRecord::Base
  belongs_to :specialty

  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }
end
