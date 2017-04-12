require 'rails_helper'

feature 'user visits root' do
  scenario 'user sees root page' do
    visit '/'

    expect(page).to have_selector('#welcome_jumbotron')
    within('#welcome_jumbotron') do
      expect(page).to have_content('Welcome to BURRP!')
      expect(page).to have_content('Sign in with Facebook below')
      expect(page).to have_content('Brewery Users Research and Remembering Point')
    end

    expect(page).to have_selector('#welcome_card', count: 3)
    within('#welcome_cards') do
      expect(page).to have_content('Search your area for local breweries')
      expect(page).to have_content('Browse the collections of artisans')
      expect(page).to have_content('Make a list of places to go and beverages to try.')
    end

    expect(page).to have_selector('.page-footer')
    within('#privacy_policy') do
      expect(page).to have_content("Privacy Policy: User information won't be disclosed to anyone.")
    end

    expect(page).to have_selector('#brewerydb_pic')
  end
end
