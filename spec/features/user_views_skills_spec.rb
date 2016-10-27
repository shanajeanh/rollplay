require 'rails_helper'

feature 'user can view character skills' do
  let!(:rank) { FactoryGirl.create(:rank) }
  let!(:character) { rank.character }
  let!(:skill) { rank.skill }
  let!(:skill2) { FactoryGirl.create(:skill, name: 'Bluff', ability: 'Cha') }
  let!(:skill3) { FactoryGirl.create(:skill, name: 'Handle Animal',
    ability: 'Cha')}
  let!(:rank2) { FactoryGirl.create(:rank, skill: skill2, character: character,
    added_ranks: 2, class_skill: false) }
  context('as a logged-on user') do
    scenario 'an authenticated user can edit their characters\'s skills' do
      login_with_google
      character2 = FactoryGirl.create(:character, user: User.last)
      Rank.create(character: character2, skill: skill2, added_ranks: 3)
      visit character_path(character2)
      click_button 'Edit'
      check 'Bluff'
      click_button 'Save Sheet'

      expect(page).to have_content 'Bluff | Cha | 7'
    end
  end

  context 'as a logged-off user' do
    scenario 'a user can view skills on their character sheet' do
      visit character_path(character)

      expect(page).to have_content 'Craft (writing)'
      expect(page).to have_content 'Bluff'
    end

    scenario 'the app is adding up skills and ranks accurately' do
      visit character_path(character)

      expect(page).to have_content 'Craft (writing) | Int | 16'
      expect(page).to have_content 'Bluff | Cha | 3'
    end

    scenario 'skills that the character has no ranks in are there' do
      visit character_path(character)

      expect(page).to have_content 'Handle Animal | Cha | 1'
    end
  end
end
