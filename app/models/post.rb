class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  before_save :set_slug

  def set_slug
    self.slug = title.parameterize
  end

end
