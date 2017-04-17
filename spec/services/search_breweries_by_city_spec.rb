require 'rails_helper'

describe 'BreweryService' do
  it '#search_by_city' do
    VCR.use_cassette('services/searches/breweries_by_city') do
      db = BreweryService.new
      breweries = db.search_by_city('Denver')
      first = breweries.first

      expect(breweries.count).to eq(50)
      expect(breweries).to be_a(Array)

      expect(first.keys.count).to eq(24)
      expect(first.has_key?(:id)).to eq(true)
      expect(first.has_key?(:streetAddress)).to eq(true)
      expect(first.has_key?(:locality)).to eq(true)
      expect(first.has_key?(:region)).to eq(true)
      expect(first.has_key?(:postalCode)).to eq(true)
      expect(first.has_key?(:phone)).to eq(true)
      expect(first.has_key?(:website)).to eq(true)
      expect(first.has_key?(:brewery)).to eq(true)
      expect(first.has_key?(:locationTypeDisplay)).to eq(true)
    end
  end
end
