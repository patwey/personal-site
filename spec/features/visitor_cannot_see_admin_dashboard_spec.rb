require 'rails_helper'

feature 'Visitor cannot view admin dashboard' do
  scenario 'unlogged in user visits admin dashboard path' do
    visit admin_dashboard_path

    within '.flash' do
      expect(page).to have_css '.flash-error', 'Please Log In'
    end
    expect(current_path).to eq login_path
  end
end
