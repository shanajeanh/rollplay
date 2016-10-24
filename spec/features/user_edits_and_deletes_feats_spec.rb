require 'rails_helper'

feature 'user can edit and delete feats' do
  context 'as an authenticated user' do
    scenario 'logged in user can edit feats' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      FactoryGirl.create(:feat, character: character)
      visit character_path(character)
      click_button 'Edit Feat'
      fill_in 'Title', with: 'FEET'
      click_button 'Save Feat'

      expect(page).to have_content 'FEET'
      expect(page).not_to have_content 'Precise Shot'
    end

    scenario 'logged in user cannot save an invalid feat' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      FactoryGirl.create(:feat, character: character)
      visit character_path(character)
      click_button 'Edit Feat'
      fill_in 'Title', with: ''
      click_button 'Save Feat'

      expect(page).to have_content 'Title can\'t be blank'
    end

    scenario 'logged in user can delete feats' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      FactoryGirl.create(:feat, character: character)
      visit character_path(character)
      click_button 'Delete Feat'

      expect(page).to have_content 'Feat deleted'
    end
  end

  context 'as a non-authenticated user' do
    scenario 'there is no edit or delete button for feats' do
      feat = FactoryGirl.create(:feat)
      character = feat.character
      visit character_path(character)

      expect(page).not_to have_button 'Edit Feat'
      expect(page).not_to have_button 'Delete Feat'
    end
  end
end
