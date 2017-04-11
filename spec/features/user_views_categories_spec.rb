require 'rails_helper'

feature 'user visits categories index' do
  scenario 'user views all categories' do
    VCR.use_cassette('features/categories') do
      visit '/categories'

      expect(page).to have_content('Categories')

      within('#category_list') do
        expect(page).to have_selector('#category_instance', count: 15)
      end
    end
  end
end
