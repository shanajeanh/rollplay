require 'rails_helper'

feature 'User views a list of their characters' do
  let!(:character) { FactoryGirl.create(:character) }
  context 'as a user' do
    scenario 'character basic descriptive info is visible' do
      visit character_path(character)

      expect(page).to have_content 'Georgia Mason'
      expect(page).to have_content 'Her zombie eyes give her darkvision'
      expect(page).to have_content 'Race: Human'
      expect(page).to have_content 'Class: Reporter'
      expect(page).to have_content 'Level: 5'
      expect(page).to have_content 'Appearance: Short black hair, sunglasses, creepy zombie eyes'
      expect(page).to have_content 'Alignment: NG'
      expect(page).to have_content 'Deity: The News'
      expect(page).to have_content 'Size: Medium'
      expect(page).to have_content 'Speed: 30 feet'
    end

    scenario 'character ability scores and bonuses are displayed' do
      visit character_path(character)

      expect(page).to have_content 'Str: 8 | -1'
      expect(page).to have_content 'Dex: 14 | 2'
      expect(page).to have_content 'Con: 10 | 0'
      expect(page).to have_content 'Int: 17 | 3'
      expect(page).to have_content 'Wis: 9 | -1'
      expect(page).to have_content 'Cha: 13 | 1'
    end

    scenario 'character has hit points, armor class, and init visible' do
      visit character_path(character)

      expect(page).to have_content 'HP: 25'
      expect(page).to have_content 'AC: 12'
      expect(page).to have_content 'Init: 2'
    end

    scenario 'character saves are displayed' do
      visit character_path(character)

      expect(page).to have_content 'Fort: 2'
      expect(page).to have_content 'Ref: 5'
      expect(page).to have_content 'Will: 2'
    end

    scenario 'character base attacks are calculated' do
      visit character_path(character)

      expect(page).to have_content 'Melee: 2'
      expect(page).to have_content 'Range: 5'
      expect(page).to have_content 'CMB: 2'
    end
  end
end
