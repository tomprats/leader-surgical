class Specialty < ActiveRecord::Base
  has_many :specialty_connections, foreign_key: :parent_id
  has_many :children, through: :specialty_connections, source: :child
  has_many :procedures

  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }

  def self.top_level
    joins("LEFT JOIN specialty_connections ON specialties.id = specialty_connections.child_id")
      .where("specialty_connections.id IS NULL")
  end
end
