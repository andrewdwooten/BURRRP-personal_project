require 'rails_helper'

feature 'logged in user visits root' do
  attr_reader :user
  before(:each) do
    @user = User.create(name:       'andreww00ten',
                        uid:        "#{ENV['uid']}",
                        provider:   "twitter",
                        token:      "#{ENV['token']}",
                        secret:     "#{ENV['secret']}")
  end
  scenario 'user sees a link to the search page in the navbar' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    within('#navbar') do
      expect(page).to have_selector('#search_link')
    end
  end
  scenario 'user can enter a search for breweries by city and view the results' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    within('#navbar') do
      click_link('Search')
    end

    expect(current_path).to eq('/search')

    fill_in "brewery_city", with: 'Denver'
    find('#brewery_search_submit').click

    using_wait_time 3 do
      expect(page).to have_selector('#brewery_instance', count: 50)
    end
  end
end
