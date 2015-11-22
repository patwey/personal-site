require 'rails_helper'

feature 'Admin logs in' do
  def create_admin
    User.create(username: 'admin',
                password: 'password',
                role: 0)
  end

  scenario 'they see the login form' do
    visit '/login'

    expect(page).to have_css 'input[type="text"][name*="username"]'
    expect(page).to have_css 'input[type="password"][name*="password"]'
  end

  scenario 'they can log in' do
    create_admin
    visit '/login'

    fill_in 'session_username', with: 'admin'
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(current_path).to eq admin_dashboard_path
  end

  scenario 'they cannot log in' do
    create_admin
    visit '/login'

    fill_in 'session_username', with: 'admin'
    fill_in 'session_password', with: 'WRONGPASSWORD'
    click_button 'Log In'

    within '.flash' do
      expect(page).to have_css '.flash-error', 'Invalid Login'
    end
    expect(current_path).to eq login_path
  end
end
