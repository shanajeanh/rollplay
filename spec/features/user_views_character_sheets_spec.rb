require 'rails_helper'

feature 'User views a list of their characters' do
  context 'as a logged in user' do
    scenario 'user visits home page and sees a list of characters' do
      login_with_google
      FactoryGirl.create(:character, user: User.first)
      visit root_path

      expect(page).to have_content 'Georgia Mason'
      expect(page).to have_content 'Her zombie eyes give her darkvision'
    end

    scenario 'each character name is a link' do
      login_with_google
      FactoryGirl.create(:character, user: User.first)
      visit characters_path
      click_link 'Georgia Mason'

      expect(page).to have_content 'Georgia Mason'
      expect(page).to have_content 'Her zombie eyes give her darkvision'
      expect(page).to have_content 'Race: Human'
      expect(page).to have_content 'Class: Reporter'
    end
  end

  context 'as a logged out user' do
    scenario 'user visits home page and does not see a character list' do
      visit root_path

      expect(page).to have_content 'Log in to view characters!'
    end
  end
end
