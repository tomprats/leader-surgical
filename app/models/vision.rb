class Vision < ApplicationRecord
  validates_presence_of :rank, :title, :text

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  to_html :text
end
