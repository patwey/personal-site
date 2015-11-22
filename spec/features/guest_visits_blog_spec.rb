require 'rails_helper'

feature 'Guest visits blog' do
  def create_post
    Post.create(title: 'My Post',
                body: 'This is the body of my post.')
  end

  scenario 'they see a post' do
    create_post
    visit root_path
    click_link 'Blog'

    within '.content' do
      expect(page).to have_css '.title', 'Blog'

      within '.posts' do
        expect(page).to have_css '.post-title', 'My Post'
        expect(page).to have_css '.post-body', 'This is the body of my post.'
      end
    end
  end
end
