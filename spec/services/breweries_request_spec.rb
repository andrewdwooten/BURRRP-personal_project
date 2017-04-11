require 'rails_helper'

describe 'brewery service' do
  it '#get_breweries returns a page of breweries' do
    VCR.use_cassette('brewery_services/get_breweries') do
      db = BreweryService.new
      raw_breweries = db.get_breweries(1)
      first = raw_breweries.first

      expect(raw_breweries.count).to eq(50)
      expect(first[:name]).to eq("#FREEDOM Craft Brewery")
      expect(first.has_key?(:description)).to eq(true)
      expect(first[:established]).to eq("2012")
      expect(first.has_key?(:images)).to eq(true)
      expect(first.has_key?(:locations)).to eq(true)
    end
  end
end
