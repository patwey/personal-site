require 'rails_helper'

describe 'projects/_project.html.haml' do
  context 'when the project has a website' do
    it 'displays the website url' do
      # assign assigns a factory to a particular class?
      project = build(:project_with_site)

      render partial: 'project', locals: { project: project }

      expect(rendered).to have_link 'Website', href: project.website_url
    end
  end

  context 'when the project has no website' do
    it 'does not display a website url' do
      project = build(:project)

      render partial: 'project', locals: { project: project }

      expect(rendered).to have_link 'Github', href: project.github_url
      expect(rendered).not_to have_link 'Website'
    end
  end
end
