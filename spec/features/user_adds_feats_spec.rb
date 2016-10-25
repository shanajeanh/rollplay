require 'rails_helper'

feature 'user can add feats' do
  context 'as an authenticated user' do
    scenario 'logged in user can add feats with only name, type, summary' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit character_path(character)
      click_button 'Add a Feat'
      fill_in 'Title', with: 'Weapon Finesse'
      fill_in 'Type', with: 'Combat'
      fill_in 'Summary', with: 'Use Dex instead of Str on attack rolls with light weapons'
      click_button 'Save Feat'

      expect(page).to have_content 'Feat added successfully'
      expect(page).to have_content 'Weapon Finesse'
    end

    scenario 'feats need a title, type, and summary' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit new_character_feat_path(character)
      fill_in 'Description', with: 'I DO WHAT I WANT'
      click_button 'Save Feat'

      expect(page).to have_content 'Title can\'t be blank'
      expect(page).to have_content 'Feat type can\'t be blank'
      expect(page).to have_content 'Summary can\'t be blank'
    end

    scenario 'user can add feats with all fields filled in' do
      login_with_google
      character = FactoryGirl.create(:character, user: User.first)
      visit new_character_feat_path(character)
      fill_in 'Title', with: 'Blind-Fight, Improved'
      fill_in 'Type', with: 'Combat'
      fill_in 'Prerequisites', with: 'Perception 10 ranks, Blind-Fight'
      fill_in 'Summary', with: 'Total concealment is considered normal concealment'
      fill_in 'Description', with: 'Your keen senses guide your hand against hidden foes.'
      fill_in 'Benefit', with: 'Your melee attacks ignore the miss chance for less than total concealment. You may still reroll your miss chance percentile roll for total concealment. If you successfully pinpoint an invisible or hidden attacker within 30 feet, that attacker gets no advantages related to hitting you with ranged attacks. That is, you don’t lose your Dexterity bonus to Armor Class, and the attacker doesn’t get the usual +2 bonus for being invisible.'
      fill_in 'Special', with: 'The Improved Blind-Fight feat is of no use against a character who is the subject of a blink spell.'
      click_button 'Save Feat'

      expect(page).to have_content 'Feat added successfully'
      expect(page).to have_content 'Blind-Fight, Improved'
      expect(page).to have_content 'Your keen senses guide your hand against hidden foes'
    end
  end

  context 'as a non-authenticated user' do
    scenario 'there is no add feat button for non-authenticated users' do
      character = FactoryGirl.create(:character)
      visit character_path(character)

      expect(page).not_to have_button 'Add a Feat'
    end

    scenario 'non-authenticated users cannot add in feats' do
      character = FactoryGirl.create(:character)
      visit new_character_feat_path(character)

      expect(page).to have_content 'You need to sign in before continuing.'
    end
  end
end
