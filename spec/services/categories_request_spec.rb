require 'rails_helper'

describe 'BreweryService' do
  it '#get_categories' do
    db = BreweryService.new
    categories = JSON.parse(db.get_categories)

    expect(categories.class).to eq(Hash)

  end
end
