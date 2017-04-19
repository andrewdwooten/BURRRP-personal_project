require 'rails_helper'

describe 'user favorite endpoint' do
  it 'returns a hash of information for the brewery id' do
    VCR.use_cassette('requests/favorite_brewery') do
      get '/api/v1/favorite_breweries', id: 'YXDiJk'

      favorite = JSON.parse(response.body)

      expect(favorite).to be_a(Hash)
      expect(favorite.keys.count).to eq(4)
      expect(favorite.has_key?('id')).to eq(true)
      expect(favorite.has_key?('name')).to eq(true)
      expect(favorite.has_key?('website')).to eq(true)
      expect(favorite.has_key?('image')).to eq(true)
    end
  end
end
