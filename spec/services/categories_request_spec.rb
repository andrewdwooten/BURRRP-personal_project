require 'rails_helper'

describe 'BreweryService' do
  it '#get_categories' do
    VCR.use_cassette('brewery_services/categories') do
      db = BreweryService.new
      categories = db.get_categories

      first = categories[:data].first
      expect(categories.class).to eq(Hash)
      expect(categories[:message]).to eq("Request Successful")
      expect(categories[:data].count).to eq(15)
      expect(first[:name]).to eq("British Origin Ales")
    end
  end
end
