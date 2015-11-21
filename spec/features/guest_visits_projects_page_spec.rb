require 'rails_helper'

feature 'Guest visits project page' do
  def create_project
    Project.create(name: 'coloRIDEo',
                   description: 'a description',
                   image_path: '/images/coloRIDEo.jpg')
  end

  scenario 'they see the project' do
    create_project
    visit root_path
    click_link 'Projects'

    within '.content' do
      expect(page).to have_css '.title', 'Projects'

      within '.projects' do
        expect(page).to have_css '.name', 'coloRIDEo'
        expect(page.find('.thumbnail')['src']).to have_content 'coloRIDEo.jpg'
        expect(page).to have_css '.description', 'a description'
      end
    end
  end
end
