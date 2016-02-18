class Procedure < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialty

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :link, with: /\Ahttp/, message: "should contain http(s)", allow_blank: true

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }

  to_html :description

  def to_hash
    hash = {
      name: name,
      link: link,
      description: description_to_html
    }

    hash[:doctor] = {
      id: doctor.id,
      name: doctor.name
    } if doctor

    hash[:specialty] = {
      id: specialty.id,
      name: specialty.name
    } if specialty

    hash
  end
end
