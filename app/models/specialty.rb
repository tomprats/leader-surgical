class Specialty < ActiveRecord::Base
  has_many :children, class_name: Specialty, foreign_key: :parent_id
  belongs_to :parent, class_name: Specialty
  belongs_to :doctor
  has_many :procedures

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :link, with: /\Ahttp/, message: "should contain http(s)", allow_blank: true

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }

  def self.top_level
    where(parent_id: nil)
  end
end
