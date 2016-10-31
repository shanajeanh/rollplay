require 'rails_helper'

feature 'user can delete their account' do
  context 'as a logged-in user' do
    scenario 'user can delete their account' do
      login_with_google
      visit root_path
      click_button 'Delete Account'

      expect(page).to have_content 'Your account and all characters have been deleted'
    end
  end
end
