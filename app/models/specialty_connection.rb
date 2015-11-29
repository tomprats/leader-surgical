class SpecialtyConnection < ActiveRecord::Base
  belongs_to :child, class_name: Specialty
  belongs_to :parent, class_name: Specialty
end
