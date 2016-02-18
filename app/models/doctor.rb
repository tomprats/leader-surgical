class Doctor < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :specialty
  has_many :specialties
  has_many :procedures

  validates_presence_of :specialty, :image, :first_name, :last_name
  validates_uniqueness_of :first_name, scope: :last_name, message: "must be unique"

  default_scope { order(:rank, :last_name, :first_name) }
  scope :active, -> { where(active: true) }

  to_html :description, :bio

  def name
    "#{first_name} #{last_name}"
  end

  def to_hash
    {
      image: image.square.url,
      name: name,
      kind: kind,
      specialty: {
        id: specialty.id,
        name: specialty.name
      },
      associations: associations,
      procedures: procedures.collect { |procedure|
        {
          id: procedure.id,
          name: procedure.name
        }
      },
      description: description_to_html,
      bio: bio_to_html
    }
  end
end
