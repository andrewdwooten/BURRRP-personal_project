require 'rails_helper'

feature 'user visits a brewery show page' do
  scenario 'user views brewery information' do
    VCR.use_cassette('/features/breweries/show') do

      visit '/breweries/SWMzJ3'

      expect(current_path).to eq(brewery_path('SWMzJ3'))

      expect(page).to have_selector('#brew_instance', count: 27)

      within all('#brew_instance').first do
        expect(page).to have_selector('#brew_name')
        expect(page).to have_selector('#brew_description')
        expect(page).to have_selector('#brew_organic')
      end

      within('#brewery_information') do
        expect(page).to have_selector('#brewery-description')
        expect(page).to have_selector('#brewery-location-contact')
      end
    end
  end
end
