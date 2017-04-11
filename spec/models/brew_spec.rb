require 'rails_helper'

describe 'brew' do
  it '#all_at_brewery returns array of brewery objects' do
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
end
