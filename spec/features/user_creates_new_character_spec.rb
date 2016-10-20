require 'rails_helper'

feature 'user can create new characters' do
  # let!(:skill) { FactoryGirl.create(:skill) }
  # let!(:skill2) { FactoryGirl.create(:skill, name: 'Use Computer', ability: 'Int') }
  # let!(:skill3) { FactoryGirl.create(:skill, name: 'Disguise', ability: 'Cha') }
  context 'as a user' do
    scenario 'there is a link to the new character page' do
      visit root_path
      click_link 'Create a Character Sheet'

      expect(current_path).to eq(new_character_path)
    end
    scenario 'a user can create a new character with just name, race, class' do
      visit new_character_path
      fill_in 'Name', with: 'Ahsoka Tano'
      fill_in 'Race', with: 'Togruta'
      fill_in 'Class', with: 'Jedi'
      click_button 'Save Sheet'

      expect(page).to have_content 'Character added successfully'
      expect(page).to have_content 'Ahsoka Tano'
      expect(page).to have_content 'Race: Togruta'
      expect(page).to have_content 'Class: Jedi'
    end

    scenario 'a user can also add other information' do
      visit new_character_path
      fill_in 'Name', with: 'Bonnibel Bubblegum'
      fill_in 'Class', with: 'Princess'
      fill_in 'Race', with: 'Bubblegum construct'
      fill_in 'Description', with: 'She rules the Candy Kingdom with an iron
        fist'
      fill_in 'Level', with: 9
      fill_in 'Appearance', with: 'Completely pink and made out of candy'
      fill_in 'Alignment', with: 'LG'
      fill_in 'Deity', with: 'Science'
      fill_in 'Speed', with: 25
      fill_in 'Strength', with: 10
      fill_in 'Dexterity', with: 12
      fill_in 'Constitution', with: 15
      fill_in 'Intelligence', with: 19
      fill_in 'Wisdom', with: 13
      fill_in 'Charisma', with: 16
      fill_in 'Hit Points', with: 52
      fill_in 'Fortitude Save', with: 5
      fill_in 'Reflex Save', with: 5
      fill_in 'Will Save', with: 3
      fill_in 'Base Attack Bonus', with: 4
      click_button 'Save Sheet'

      expect(page).to have_content 'Character added successfully'
      expect(page).to have_content 'Bonnibel Bubblegum'
      expect(page).to have_content 'HP: 52'
      expect(page).to have_content 'She rules the Candy Kingdom with an iron
        fist'
      expect(page).to have_content 'Level: 9'
      expect(page).to have_content 'Completely pink and made out of candy'
      expect(page).to have_content 'Alignment: LG'
      expect(page).to have_content 'Deity: Science'
      expect(page).to have_content 'Speed: 25 feet'
    end

    scenario 'the sheet calculates stats based on ability input' do
      visit new_character_path
      fill_in 'Name', with: 'Bonnibel Bubblegum'
      fill_in 'Class', with: 'Princess'
      fill_in 'Race', with: 'Bubblegum construct'
      fill_in 'Description', with: 'She rules the Candy Kingdom with an iron
        fist'
      fill_in 'Level', with: 9
      fill_in 'Appearance', with: 'Completely pink and made out of candy'
      fill_in 'Alignment', with: 'LG'
      fill_in 'Deity', with: 'Science'
      fill_in 'Strength', with: 10
      fill_in 'Dexterity', with: 12
      fill_in 'Constitution', with: 15
      fill_in 'Intelligence', with: 19
      fill_in 'Wisdom', with: 13
      fill_in 'Charisma', with: 16
      click_button 'Save Sheet'

      expect(page).to have_content 'Character added successfully'
      expect(page).to have_content 'Str: 10 | 0'
      expect(page).to have_content 'Dex: 12 | 1'
      expect(page).to have_content 'Con: 15 | 2'
      expect(page).to have_content 'Int: 19 | 4'
      expect(page).to have_content 'Wis: 13 | 1'
      expect(page).to have_content 'Cha: 16 | 3'
    end

    scenario 'the sheet calculates attacks, saves, defence, hp, and init' do
      visit new_character_path
      fill_in 'Name', with: 'Bonnibel Bubblegum'
      fill_in 'Class', with: 'Princess'
      fill_in 'Race', with: 'Bubblegum construct'
      fill_in 'Description', with: 'She rules the Candy Kingdom with an iron fist'
      fill_in 'Level', with: 9
      fill_in 'Appearance', with: 'Completely pink and made out of candy'
      fill_in 'Alignment', with: 'LG'
      fill_in 'Deity', with: 'Science'
      fill_in 'Strength', with: 10
      fill_in 'Dexterity', with: 12
      fill_in 'Constitution', with: 15
      fill_in 'Intelligence', with: 19
      fill_in 'Wisdom', with: 13
      fill_in 'Charisma', with: 16
      fill_in 'Hit Points', with: 52
      fill_in 'Fortitude Save', with: 5
      fill_in 'Reflex Save', with: 5
      fill_in 'Will Save', with: 3
      fill_in 'Base Attack Bonus', with: 4
      click_button 'Save Sheet'

      expect(page).to have_content 'Character added successfully'
      expect(page).to have_content 'AC: 11'
      expect(page).to have_content 'Init: 1'
      expect(page).to have_content 'Fort: 7'
      expect(page).to have_content 'Ref: 6'
      expect(page).to have_content 'Will: 4'
      expect(page).to have_content 'Melee: 4'
      expect(page).to have_content 'Ranged: 5'
      expect(page).to have_content 'CMB: 4'
    end

    scenario 'a user receives error messages if character has no name' do
      visit new_character_path
      fill_in 'Race', with: 'Togruta'
      fill_in 'Class', with: 'Jedi'
      click_button 'Save Sheet'

      expect(page).to have_content "Name can't be blank"
    end

    scenario 'a user receives error messages if character has no race' do
      visit new_character_path
      fill_in 'Name', with: 'Ahsoka Tano'
      fill_in 'Class', with: 'Jedi'
      click_button 'Save Sheet'

      expect(page).to have_content "Character race can't be blank"
    end

    scenario 'a user receives error messages if character has no class' do
      visit new_character_path
      fill_in 'Name', with: 'Ahsoka Tano'
      fill_in 'Race', with: 'Togruta'
      click_button 'Save Sheet'

      expect(page).to have_content "Character class can't be blank"
    end
  end
end
