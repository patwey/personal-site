require 'rails_helper'

feature 'Admin creates post' do
  def admin_logs_in
    User.create(username: 'admin',
                password: 'password',
                role: 0)

    visit login_path

    fill_in 'session_username', with: 'admin'
    fill_in 'session_password', with: 'password'
    click_button 'Log In'
  end

  scenario 'they can create a post' do
    admin_logs_in

    click_link 'Blog Posts'
    click_link 'Create New Blog Post'
    fill_in 'Title', with: 'My Post'
    fill_in 'Body', with: 'The body of my post.'
    click_button 'Create Post'

    expect(current_path).to eq admin_posts_path
    within '.flash' do
      expect(page).to have_css '.flash-notice', 'My Post Created'
    end
    within '#my-post' do
      expect(page).to have_css '.post-title', 'My Post'
      expect(page).to have_css '.post-body', 'The body of my post.'
    end
  end

  scenario 'they cannot create a post' do
    admin_logs_in

    click_link 'Blog Posts'
    click_link 'Create New Blog Post'
    fill_in 'Title', with: ''
    click_button 'Create Post'

    expect(current_path).to eq new_admin_post_path
    within '.flash' do
      expect(page).to have_css '.flash-error', 'Please enter a title and body'
    end
  end
end

