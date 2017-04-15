require 'rails_helper'

feature 'user visits brewery index' do
  scenario 'user views listing of all breweries' do
    VCR.use_cassette('features/breweries/index') do
    visit '/breweries'

    expect(page).to have_content('Breweries')
    within('#brewery_list') do
      expect(page).to have_selector('#brewery_instance', count: 40)
    end

    within all('#brewery_instance').first do
      expect(page).to have_selector('#brewery_image')
      expect(page).to have_selector('#brewery_name')
      expect(page).to have_selector('#brewery_website')
    end
    end
  end
end
