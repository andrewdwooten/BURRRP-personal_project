require 'rails_helper'

feature 'user favorites brewery' do
  attr_reader :user
  before(:each) do
    @user = User.create(name:       'andreww00ten',
                        uid:        "#{ENV['uid']}",
                        provider:   "twitter",
                        token:      "#{ENV['token']}",
                        secret:     "#{ENV['secret']}")
    end
  scenario 'it is associated with that user' do
    VCR.use_cassette('features/breweries/favorite_breweries') do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/breweries'

      within all('#brewery_instance').first do
        page.find("#favorite_brewery").click
      end

      expect(current_path).to eq('/breweries')

      within('.flash') do
        expect(page).to have_content('Brewery added to your favorites!')
      end

      expect(user.favorite_breweries.count).to eq(1)
    end
  end
  scenario 'user cannot favorite the same brewery twice' do
    VCR.use_cassette('features/breweries/cannot_favorite_same_brewery_twice') do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/breweries'

      within all('#brewery_instance').first do
        page.find("#favorite_brewery").click
      end

      expect(current_path).to eq('/breweries')

      within('.flash') do
        expect(page).to have_content('Brewery added to your favorites!')
      end

      expect(user.favorite_breweries.count).to eq(1)

      within all('#brewery_instance').first do
        page.find("#favorite_brewery").click
      end

      within('.flash') do
        expect(page).to have_content('That brewery is already in your favorites!')
      end

      expect(user.favorite_breweries.count).to eq(1)
    end
  end
end
