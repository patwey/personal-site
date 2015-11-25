FactoryGirl.define do
  factory :project do
    name "My Site"
    description  "This is my site"
    github_url "github.com/mysite"
  end

  factory :project_with_site, class: Project do
    name "Your Site"
    description  "This is my site"
    github_url "github.com/mysite"
    website_url "yoursite.com"
  end
end
