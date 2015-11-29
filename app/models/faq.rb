class FAQ < ActiveRecord::Base
  validates_presence_of :rank, :question, :answer
  validates_uniqueness_of :question

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }
end
