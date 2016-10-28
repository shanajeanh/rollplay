require 'rails_helper'

feature 'user can add weapons' do
  context 'as an authenticated user' do
    scenario 'logged in user can add weapons with name and damage' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit character_path(character)
      click_button 'Add a Weapon'
      fill_in 'Name', with: 'Sword of Swording'
      fill_in 'Damage Roll', with: '1d6 + 2'
      click_button 'Save Weapon'

      expect(page).to have_content 'Weapon added successfully'
      expect(page).to have_content 'Sword of Swording'
      expect(page).to have_content 'Attack: 2'
    end

    scenario 'feats need a name and damage' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit new_character_weapon_path(character)
      fill_in 'Special', with: 'I DO WHAT I WANT'
      click_button 'Save Weapon'

      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_content 'Damage can\'t be blank'
    end

    scenario 'user can add weapons with all weapon fields filled in' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit new_character_weapon_path(character)
      fill_in 'Name', with: '+1 Sword of Swording'
      fill_in 'Damage Roll', with: '1d6 + 3'
      fill_in 'Bonus', with: 1
      fill_in 'Crit', with: '19-20, x3'
      fill_in 'Range', with: 'Melee'
      fill_in 'Size', with: 'Stupidly large'
      fill_in 'Damage type', with: 'Slashing'
      fill_in 'Special', with: 'This sword will protect you from zombie guts.'
      check 'Use Dex'
      click_button 'Save Weapon'

      expect(page).to have_content 'Weapon added successfully'
      expect(page).to have_content '+1 Sword of Swording'
      expect(page).to have_content 'Attack: 6'
      expect(page).to have_content 'This sword will protect you from zombie guts.'
    end
  end

  context 'as a non-authenticated user' do
    scenario 'there is no add weapon button for non-authenticated users' do
      character = FactoryGirl.create(:character)
      visit character_path(character)

      expect(page).not_to have_button 'Add a Weapon'
    end

    scenario 'non-authenticated users cannot add in weapons' do
      character = FactoryGirl.create(:character)
      visit new_character_weapon_path(character)

      expect(page).to have_content 'You need to sign in before continuing.'
    end
  end
end
