require 'rails_helper'

feature 'user can add spells' do
  context 'as an authenticated user' do
    scenario 'logged in user can add spells' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first, caster: true)
      visit character_path(character)
      click_button 'Add a Spell'
      fill_in 'Title', with: 'There Can Be Miracles'
      fill_in 'Summary', with: 'When You Believe'
      fill_in 'Level', with: 5
      fill_in 'Range', with: 'Touch'
      click_button 'Save Spell'

      expect(page).to have_content 'Spell added successfully'
      expect(page).to have_content 'There Can Be Miracles'
    end

    scenario 'spells need a title and Description' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first, caster: true)
      visit new_character_spell_path(character)
      fill_in 'Description', with: 'I DO WHAT I WANT'
      click_button 'Save Spell'

      expect(page).to have_content 'Title can\'t be blank'
    end

    scenario 'user can add spells with all fields filled in' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first, caster: true)
      visit new_character_spell_path(character)
      fill_in 'Title', with: 'Speak Truth'
      fill_in 'Level', with: 4
      fill_in 'Summary', with: 'Characters effected can only speak the truth'
      fill_in 'Range', with: 'Area'
      fill_in 'Duration', with: '1 minute per round'
      fill_in 'Spell save', with: '15'
      fill_in 'Description', with: 'Orb of truth telling'
      click_button 'Save Spell'

      expect(page).to have_content 'Speak Truth'
      expect(page).to have_content 'Characters effected can only speak the truth'
    end
  end

  context 'as a non-authenticated user' do
    scenario 'there is no add spell button for non-authenticated users' do
      character = FactoryGirl.create(:character)
      visit character_path(character)

      expect(page).not_to have_button 'Add a Spell'
    end

    scenario 'non-authenticated users cannot add in spells' do
      character = FactoryGirl.create(:character)
      visit new_character_spell_path(character)

      expect(page).to have_content 'You need to sign in before continuing.'
    end
  end
end
