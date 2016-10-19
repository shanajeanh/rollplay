require 'rails_helper'

feature 'user can add skills to their character' do
  let!(:rank) { FactoryGirl.create(:rank) }
  let!(:character) { rank.character }
  let!(:skill) { rank.skill }
  let!(:skill2) { FactoryGirl.create(:skill, name: 'Bluff', ability: 'Cha') }
  let!(:rank2) { FactoryGirl.create(:rank, skill: skill2, added_ranks: 2, class_skill: false) }
  context 'as a user' do
    scenario 'a user can view skills on their character sheet' do
      visit character_path(character)

      expect(page).to have_content 'Craft (writing)'
      expect(page).to have_content 'Bluff'
    end

    scenario 'the app is adding up skills and ranks accurately' do
      visit character_path(character)

      expect(page).to have_content 'Craft (Writing) | Int | 16'
      expect(page).to have_content 'Bluff | Cha | 3'
    end
  end
end
