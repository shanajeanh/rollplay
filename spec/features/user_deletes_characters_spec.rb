require 'rails_helper'

feature 'user can delete their character sheets' do
  context 'as a logged-in user' do
    scenario 'there is a link to delete the sheet' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit character_path(character)
      click_link 'Delete'

      expect(page).to have_content 'Character deleted'
      expect(page).not_to have_content 'Georgia Mason'
    end
  end

  context 'as a logged-off user' do
    scenario 'there is no delete link for non-authenticated users' do
      character = FactoryGirl.create(:character)
      visit character_path(character)

      expect(page).not_to have_link 'Delete'
    end
  end
end
