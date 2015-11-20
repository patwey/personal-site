require 'rails_helper'

feature 'Guest visits about page' do
  scenario 'they see the about page' do
    visit root_path
    click_link 'About'

    within '.content' do
      expect(page).to have_css '.title', 'About'

      within '.bio' do
        expect(page.find('#headshot')['src']).to have_content 'headshot.jpg'
        expect(page).to have_css '#about-me'
      end

      within '.links' do
        expect(page).to have_link 'Email'
        expect(page).to have_link 'Github'
        expect(page).to have_link 'LinkedIn'
      end
    end
  end
end
