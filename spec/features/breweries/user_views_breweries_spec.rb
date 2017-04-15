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
  scenario 'user may navigate forward in one page increments' do
    VCR.use_cassette('features/breweries/index_pagination') do
      visit '/breweries'

      expect(page).to have_content('Breweries')
      within('#brewery_list') do
        expect(page).to have_selector('#brewery_instance', count: 40)
      end

      within all('#brewery_name').first do
        expect(page).to have_content('#FREEDOM Craft Brewery')
      end

      find('#next_page').click

      expect(current_path).to eq('/breweries')

      within all('#brewery_name').first do
        expect(page).to have_content('3 Daughters Brewing')
      end
    end
  end
  scenario 'user may navigate backwards in one page increments' do
    VCR.use_cassette('features/breweries/index_pagination_rearward') do
      visit '/breweries?brewery_page=2'

      expect(page).to have_content('Breweries')

      within('#brewery_list') do
        expect(page).to have_selector('#brewery_instance', count: 46)
      end

      within all('#brewery_name').first do
        expect(page).to have_content('3 Daughters Brewing')
      end

      find('#previous_page').click

      expect(current_path).to eq('/breweries')

      within all('#brewery_name').first do
        expect(page).to have_content('#FREEDOM Craft Brewery')
      end

    end
  end
end
