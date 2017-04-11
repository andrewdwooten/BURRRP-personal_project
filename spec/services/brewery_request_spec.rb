require 'rails_helper'

describe 'brewery service' do
  it '#get_brewery returns a single brewery by id' do
    tap = BreweryService.new
    brewery = tap.get_brewery("SWMzJ3").first

    expect(brewery[:name]).to eq("Ass Clown Brewing Company")
    expect(brewery[:website]).to eq("http://www.assclownbrewing.com/")
    expect(brewery.has_key?(:images)).to eq(true)
    expect(brewery.has_key?(:locations)).to eq(true)
  end
end
