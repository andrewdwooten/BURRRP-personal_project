require 'rails_helper'

feature 'user visits a brewery show page' do
  scenario 'user views brewery information' do

    visit '/breweries?id=kaldjf'
  end
end
