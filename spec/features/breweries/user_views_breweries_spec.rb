require 'rails_helper'

feature 'user visits brewery index' do
  attr_reader :user
  before(:each) do
    @user = User.create(name:       'andreww00ten',
                        uid:        "#{ENV['uid']}",
                        provider:   "twitter",
                        token:      "#{ENV['token']}",
                        secret:     "#{ENV['secret']}")
    end
  scenario 'user views listing of all breweries' do
    VCR.use_cassette('features/breweries/index') do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/breweries'

      expect(page).to have_content('Breweries')

        expect(page).to have_selector('#brewery_instance', count: 40)


      within all('#brewery_instance').first do
        expect(page).to have_selector('#brewery_image')
        expect(page).to have_selector('#brewery_name')
        expect(page).to have_selector('#brewery_website')
      end

    end
  end
  scenario 'user may navigate forward in one page increments' do
    VCR.use_cassette('features/breweries/index_pagination') do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/breweries'

      expect(page).to have_content('Breweries')

        expect(page).to have_selector('#brewery_instance', count: 40)


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
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/breweries?brewery_page=2'

      expect(page).to have_content('Breweries')

        expect(page).to have_selector('#brewery_instance', count: 46)


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
