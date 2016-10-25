require 'rails_helper'

feature 'User views character sheet' do
  let!(:character) { FactoryGirl.create(:character) }
  context 'as a user' do
    scenario 'character basic descriptive info is visible' do
      visit character_path(character)

      expect(page).to have_content 'Georgia Mason'
      expect(page).to have_content 'Her zombie eyes give her darkvision'
      expect(page).to have_content 'Race: Human'
      expect(page).to have_content 'Class: Reporter'
      expect(page).to have_content 'Level: 5'
      expect(page).to have_content 'Appearance: Short black hair, sunglasses,
        creepy zombie eyes'
      expect(page).to have_content 'Alignment: NG'
      expect(page).to have_content 'Deity: The News'
      expect(page).to have_content 'Size: Medium'
      expect(page).to have_content 'Speed: 30 feet'
    end

    scenario 'character ability scores and bonuses are displayed' do
      visit character_path(character)

      expect(page).to have_content 'Strength 8 -1'
      expect(page).to have_content 'Dexterity 14 2'
      expect(page).to have_content 'Constitution 10 0'
      expect(page).to have_content 'Intelligence 17 3'
      expect(page).to have_content 'Wisdom 9 -1'
      expect(page).to have_content 'Charisma 13 1'
    end

    scenario 'character has hit points, armor class, and init visible' do
      visit character_path(character)

      expect(page).to have_content 'HP: 25'
      expect(page).to have_content 'AC: 12'
      expect(page).to have_content 'Init: 2'
    end

    scenario 'character saves are displayed' do
      visit character_path(character)

      expect(page).to have_content 'Fort: 0'
      expect(page).to have_content 'Ref: 5'
      expect(page).to have_content 'Will: 2'
    end

    scenario 'character base attacks are calculated' do
      visit character_path(character)

      expect(page).to have_content 'Melee: 2'
      expect(page).to have_content 'Ranged: 5'
      expect(page).to have_content 'CMB: 2'
    end
  end
end
