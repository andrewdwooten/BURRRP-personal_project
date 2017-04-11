require 'rails_helper'

describe 'brewery' do
  it '#get_by_page returns 50 brewery objects' do
    VCR.use_cassette('models/brewery/get_by_page') do
      brewery = Brewery.new
      breweries = brewery.get_by_page(1)
      first = breweries.first

      expect(breweries.count).to eq(40)
      expect(first).to respond_to(:id)
      expect(first).to respond_to(:name)
      expect(first).to respond_to(:description)
      expect(first).to respond_to(:image)
      expect(first).to respond_to(:website)
    end
  end
end
