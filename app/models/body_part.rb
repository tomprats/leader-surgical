class BodyPart < ApplicationRecord
  belongs_to :doctor
  has_many :procedures

  validates_uniqueness_of :name
  validates_presence_of :doctor, :name, :color, :coords

  scope :active, -> { where(active: true) }

  to_html :description

  def to_hash
    hash = {
      name: name,
      description: description_to_html,
      procedures: procedures.collect { |procedure|
        {
          id: procedure.id,
          name: procedure.name
        }
      }
    }

    hash[:doctor] = {
      id: doctor.id,
      name: doctor.name
    } if doctor

    hash
  end
end
