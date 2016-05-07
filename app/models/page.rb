class Page < ApplicationRecord
  belongs_to :specialty

  validates_presence_of :rank, :path, :name, :text
  validates_uniqueness_of :path

  default_scope { where(active: true).order(:rank) }

  to_html :text

  before_validation :format_path

  private
  def format_path
    self.path = self.path.parameterize
  end
end
