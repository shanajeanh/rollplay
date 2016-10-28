require 'rails_helper'

feature 'user can add class abilities' do
  context 'as an authenticated user' do
    scenario 'logged in user can add class abilities with a name and description' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit character_path(character)
      click_button 'Add a Class Ability'
      fill_in 'Title', with: 'Being Rad'
      fill_in 'Description', with: 'This is the class ability that makes you the most rad'
      click_button 'Save Class Ability'

      expect(page).to have_content 'Class ability added successfully'
      expect(page).to have_content 'Being Rad'
    end

    scenario 'class abilities need a title, type, and summary' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit new_character_class_ability_path(character)
      fill_in 'Description', with: 'I DO WHAT I WANT'
      click_button 'Save Class Ability'

      expect(page).to have_content 'Title can\'t be blank'
    end
  end

  context 'as a non-authenticated user' do
    scenario 'there is no add class ability button for non-authenticated users' do
      character = FactoryGirl.create(:character)
      visit character_path(character)

      expect(page).not_to have_button 'Add a Feat'
    end

    scenario 'non-authenticated users cannot add in class abilities' do
      character = FactoryGirl.create(:character)
      visit new_character_class_ability_path(character)

      expect(page).to have_content 'You need to sign in before continuing.'
    end
  end
end
