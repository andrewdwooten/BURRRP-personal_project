require 'rails_helper'

describe 'brew' do
  it '#all_at_brewery returns array of brewery objects if service return is not nil' do
    VCR.use_cassette('models/brew/all_at_brewery') do
      brew = Brew.new
      beers = brew.all_at_brewery('SWMzJ3')
      first = beers.first

      expect(beers.count).to eq(27)
      expect(first.id).to eq('0Z3EHV')
      expect(first.name).to eq('Apricot Seed Pale Ale')
      expect(first).to respond_to(:description)
      expect(first.organic?).to eq('N')
    end
  end
  it '#all_at_brewery returns empty array if no beers for brewery' do
    VCR.use_cassette('models/brew/all_at_brewery_sad') do
      brew = Brew.new
      beers = brew.all_at_brewery('r4JMh7')

      expect(beers).to be_a(Array)
      expect(beers.empty?).to eq(true)
    end
  end
end
