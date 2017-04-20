require 'rails_helper'

describe FavoriteBrewery, type: :model do
  context 'relationships' do
      it { should have_many(:users_favorite_breweries) }
  end
  context 'validations' do
    it 'has a unique uid' do
      good = FavoriteBrewery.create(uid: '1234')
      bad  = FavoriteBrewery.create(uid: '1234')

      expect(bad).to be_invalid
    end
  end
end
