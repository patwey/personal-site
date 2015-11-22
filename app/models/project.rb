class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :github_url, presence: true

  def has_website?
    self.website_url
  end
end
