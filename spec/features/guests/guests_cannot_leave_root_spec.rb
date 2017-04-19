require 'rails_helper'

feature 'guest permissions' do
  scenario 'guest cannot view breweries' do

    visit '/breweries'

    expect(current_path).to eq('/')

    within('.flash') do
      expect(page).to have_content("Log in with Twitter to access that feature.")
    end
  end

  scenario 'guest cannot view a brewery' do

    visit '/breweries/SWMzJ3'

    expect(current_path).to eq('/')

    within('.flash') do
      expect(page).to have_content("Log in with Twitter to access that feature.")
    end
  end

  scenario 'guest cannot view search page' do

    visit '/search'

    expect(current_path).to eq('/')

    within('.flash') do
      expect(page).to have_content("Log in with Twitter to access that feature.")
    end
  end
end
