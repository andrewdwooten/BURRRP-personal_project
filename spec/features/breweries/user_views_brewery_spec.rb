require 'rails_helper'

feature 'user visits a brewery show page' do
  scenario 'user views brewery information' do
    VCR.use_cassette('/features/breweries/show') do

      visit '/breweries/SWMzJ3'

      expect(current_path).to eq(brewery_path('SWMzJ3'))

      expect(page).to have_selector('#brew_instance', count: 27)

      within all('#brew_instance').first do
        expect(page).to have_selector('#brew_name')
      end

      within('#brewery-show-row') do
        expect(page).to have_selector('#brewery_show_card')
        expect(page).to have_selector('#brewery_description')
        expect(page).to have_selector('#brewery_show_image')
      end

      expect(page).to have_selector('#brewery-location-contact')

    end
  end
end
