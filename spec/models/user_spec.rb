require 'rails_helper'

describe User, type: :model do
  context 'relationships' do
      it { should have_many(:users_favorite_breweries) }
      it { should have_many(:favorite_breweries) }
  end
  context 'methods' do
    it '#favorite_breweries_ids' do
      user = User.create(name: 'test')
      user.favorite_breweries.create(uid: '1234')
      user.favorite_breweries.create(uid: 'test')

      expect(user.favorite_breweries.count).to eq(2)
      expect(user.favorite_breweries_ids).to eq(['1234', 'test'])
    end
  end
end
