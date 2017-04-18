require 'rails_helper'

describe 'breweries search endpoint' do
  it 'returns breweries within specified search parameters' do
    VCR.use_cassette('requests/breweries_search') do
      get '/api/v1/breweries_search', {brewery_city: 'Denver'}

      breweries = JSON.parse(response.body)
      first = breweries.first

      expect(breweries.count).to eq(43)
      expect(breweries).to be_a(Array)
      expect(first).to be_a(Hash)
      expect(first.has_key?('id')).to eq(true)
      expect(first.has_key?('name')).to eq(true)
      expect(first.has_key?('street')).to eq(true)
      expect(first.has_key?('city')).to eq(true)
      expect(first.has_key?('state')).to eq(true)
      expect(first.has_key?('zip')).to eq(true)
      expect(first.has_key?('phone')).to eq(true)
      expect(first.has_key?('website')).to eq(true)
      expect(first.has_key?('kind')).to eq(true)
      expect(first.has_key?('image')).to eq(true)
    end
  end
end
