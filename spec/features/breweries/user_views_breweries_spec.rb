require 'rails_helper'

feature 'user visits brewery index' do
  scenario 'user views listing of all breweries' do

    visit '/breweries'

    expect(page).to have_content('Breweries')
  end
end
