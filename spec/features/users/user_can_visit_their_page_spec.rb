require 'rails_helper'

feature 'user views their page' do
  attr_reader :user
  before(:each) do
    @user = User.create(name:       'andreww00ten',
                        uid:        "#{ENV['uid']}",
                        provider:   "twitter",
                        token:      "#{ENV['token']}",
                        secret:     "#{ENV['secret']}")
    end
  scenario 'user sees their profile information' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/users/#{user.id}"

    expect(page).to have_content('andreww00ten')
    expect(page).to have_selector('#user-favorites')
  end
end
