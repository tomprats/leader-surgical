class Procedure < ApplicationRecord
  belongs_to :specialty

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :link, with: /\Ahttp/, message: "should contain http(s)", allow_blank: true

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }
end
