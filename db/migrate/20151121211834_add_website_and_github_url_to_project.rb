class AddWebsiteAndGithubUrlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :website_url, :string
    add_column :projects, :github_url, :string
  end
end
