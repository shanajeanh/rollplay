require 'rails_helper'

feature 'User views a list of their characters' do
  let!(:character) { FactoryGirl.create(:character) }
  context 'as a user' do
    scenario 'user visits home page and sees a list of characters' do
      visit root_path

      expect(page).to have_content 'Georgia Mason'
      expect(page).to have_content 'Her zombie eyes give her darkvision'
    end
  end
end
