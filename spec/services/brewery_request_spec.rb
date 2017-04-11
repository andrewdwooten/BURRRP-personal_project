require 'rails_helper'

describe 'brewery service' do
  it '#get_brewery returns a single brewery by id' do
    VCR.use_cassette('services/breweries/brewery_request') do
      tap = BreweryService.new
      brewery = tap.get_brewery("SWMzJ3")

      expect(brewery[:name]).to eq("Ass Clown Brewing Company")
      expect(brewery[:website]).to eq("http://www.assclownbrewing.com/")
      expect(brewery.has_key?(:images)).to eq(true)
      expect(brewery.has_key?(:locations)).to eq(true)
    end
  end

  it '#get_brewery_beers returns a brewery by id' do
    VCR.use_cassette('services/breweries/brewery_beers') do
      tap = BreweryService.new
      beers = tap.get_brewery_beers("SWMzJ3")
      beer = beers.first

      expect(beers.count).to eq(27)
      expect(beer[:name]).to eq("Apricot Seed Pale Ale")
      expect(beer.has_key?(:description)).to eq(true)
      expect(beer[:style][:abvMin]).to eq("4.5")
      expect(beer[:style][:abvMax]).to eq("5.6")
      expect(beer[:style][:ibuMin]).to eq("30")
      expect(beer[:style][:ibuMax]).to eq("42")
      expect(beer[:isOrganic]).to eq("N")
    end
  end
end
