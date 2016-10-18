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
    end
  end
end
