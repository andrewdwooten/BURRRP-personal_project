require 'rails_helper'

feature 'user visits categories index' do
  scenario 'user views all categories' do

    visit '/categories'

    expect(page).to have_content('Categories')
  end
end
