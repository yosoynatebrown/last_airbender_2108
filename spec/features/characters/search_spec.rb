require 'rails_helper'

RSpec.describe 'Character search' do
  before(:each) do
    visit search_path(nation: "fire_nation")
  end

  it 'has the ability to search for characters by team' do

    expect(page).to have_content("Admiral Chan")
    expect(page).to have_content("Fire Nation")
    expect(page).to have_content("Azula")
    expect(page).to have_css("img[src*='Chan.png']")
  end

  it 'does not have detailed information past the first 25 characters' do
    within '#character-Jee' do
      expect(page).to have_content("Jee")
      expect(page).to have_content("Fire Nation Navy")

      expect(page).not_to have_css("img[src*='Jee.png']")
    end
  end

  it 'has the word none if no allies or enemies' do 
    within "#character-Ember-Island-Players" do
      expect(page).to have_content("Allies:\nNone")
      expect(page).to have_content("Enemies:\nNone")
    end
  end
end
