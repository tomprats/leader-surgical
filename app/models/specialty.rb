class Specialty < ApplicationRecord
  has_many :children, class_name: Specialty, foreign_key: :parent_id
  belongs_to :parent, class_name: Specialty
  belongs_to :doctor
  has_many :procedures

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :link, with: /\Ahttp/, message: "should contain http(s)", allow_blank: true

  default_scope { order(:name) }
  scope :active, -> { where(active: true) }

  to_html :description

  def self.top_level
    where(parent_id: nil)
  end

  def to_hash
    hash = {
      name: name,
      link: link,
      description: description_to_html,
      children: children.collect { |child|
        {
          id: child.id,
          name: child.name
        }
      },
      procedures: procedures.collect { |procedure|
        {
          id: procedure.id,
          name: procedure.name
        }
      }
    }

    hash[:parent] = {
      id: parent.id,
      name: parent.name
    } if parent

    hash[:doctor] = {
      id: doctor.id,
      name: doctor.name
    } if doctor

    hash
  end
end
