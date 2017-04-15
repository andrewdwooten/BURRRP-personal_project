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
  scenario 'user sees a search tab in the navbar' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    within('#navbar') do
      expect(page).to have_selector('#search-breweries')
    end
  end
end
