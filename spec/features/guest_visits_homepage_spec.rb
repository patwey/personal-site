require 'rails_helper'

feature 'Guest visits homepage' do
  scenario 'they see the homepage' do
    visit root_path

    within '.content' do
      expect(page).to have_css '.name', 'Pat Wey'
      within '.links' do
        expect(page).to have_link 'About'
        expect(page).to have_link 'Blog'
        expect(page).to have_link 'Projects'
      end
    end
  end
end
