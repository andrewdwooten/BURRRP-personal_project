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

  it '#get_brewery returns 1 brewery object' do
    VCR.use_cassette('models/brewery/get_brewery') do
      brewery = Brewery.new
      brewery = brewery.get_brewery('SWMzJ3')

      expect(brewery.class).to eq(Brewery)
      expect(brewery.id).to eq('SWMzJ3')
      expect(brewery.name).to eq('Ass Clown Brewing Company')
      expect(brewery).to respond_to(:description)
      expect(brewery.image).to eq("https://s3.amazonaws.com/brewerydbapi/brewery/SWMzJ3/upload_VIuw0b-squareMedium.png")
      expect(brewery.website).to eq("http://www.assclownbrewing.com/")
      expect(brewery.street).to eq("10620 Bailey Road")
      expect(brewery.city).to eq("Cornelius")
      expect(brewery.state).to eq("North Carolina")
      expect(brewery.kind).to eq("Micro Brewery")
      expect(brewery.phone).to eq("704-995-7767")
    end
  end

  it '#search_by_city array of hashes' do
    VCR.use_cassette('models/brewery/search_by_city') do
      brewery = Brewery.new
      breweries = brewery.search_by_city('Denver')

      brewery = breweries.first

      expect(breweries).to be_a(Array)
      expect(breweries.count).to eq(43)
      expect(brewery).to be_a(Hash)
      expect(brewery.has_key?(:id)).to eq(true)
      expect(brewery.has_key?(:name)).to eq(true)
      expect(brewery.has_key?(:street)).to eq(true)
      expect(brewery.has_key?(:city)).to eq(true)
      expect(brewery.has_key?(:state)).to eq(true)
      expect(brewery.has_key?(:zip)).to eq(true)
      expect(brewery.has_key?(:phone)).to eq(true)
      expect(brewery.has_key?(:website)).to eq(true)
      expect(brewery.has_key?(:kind)).to eq(true)
      expect(brewery.has_key?(:image)).to eq(true)
    end
  end

  it '#get_user_favorite one hash with appropriate data' do
    VCR.use_cassette('models/brewery/get_user_favorite') do
      brewery = Brewery.new
      favorite = brewery.get_user_favorite('YXDiJk')

      
      expect(favorite).to be_a(Hash)
      expect(favorite.keys.count).to eq(4)
      expect(favorite.has_key?(:id)).to eq(true)
      expect(favorite.has_key?(:name)).to eq(true)
      expect(favorite.has_key?(:website)).to eq(true)
      expect(favorite.has_key?(:image)).to eq(true)
    end
  end
end
