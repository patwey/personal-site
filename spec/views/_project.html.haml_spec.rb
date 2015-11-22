require 'rails_helper'

describe 'projects/_project.html.haml' do
  context 'when the project has a website' do
    it 'displays the website url' do
      skip('Figure out how to write a view spec')
      assign(:project, build(:project, website_url: 'mysite.com'))

      render

      expect(rendered).to have_link 'Website', href: 'mysite.com'
    end
  end

  context 'when the project has no website' do
    it 'does not display a website url' do
      skip('Figure out how to write a view spec')
      assign(:project, build(:project, website_url: nil))

      render

      expect(rendered).not_to have_link 'Website'
    end
  end
end
