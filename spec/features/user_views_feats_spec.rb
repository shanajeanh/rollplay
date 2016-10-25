require 'rails_helper'

feature 'user can view feats' do
  let!(:feat) { FactoryGirl.create(:feat) }
  let!(:feat2) { FactoryGirl.create(:feat, title: 'Point Blank Shot') }
  let!(:feat3) { FactoryGirl.create(:feat, title: 'Lame Feat for Losers', character: FactoryGirl.create(:character, name: 'Dumbface')) }
  let!(:character) { feat.character }
  context 'as a user' do
    scenario 'all feats are visible' do
      visit character_path(character)

      expect(page).to have_content 'Precise Shot'
      expect(page).to have_content 'Point Blank Shot'
      expect(page).not_to have_content 'Lame Feat for Losers'
    end

    scenario 'all details for feats are visible' do
      visit character_path(character)

      expect(page).to have_content 'Precise Shot'
      expect(page).to have_content 'Combat'
      expect(page).to have_content 'Prerequisites: Point Blank Shot'
      expect(page).to have_content 'No penalty for shooting into melee.'
      expect(page).to have_content 'You are adept at firing ranged attacks into melee.'
      expect(page).to have_content 'You can shoot or throw ranged weapons at an opponent engaged in melee without taking the standard –4 penalty on your attack roll.'
      expect(page).to have_content 'this isn\'t a very special feat'
    end
  end
end
