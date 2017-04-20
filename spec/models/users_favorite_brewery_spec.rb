require 'rails_helper'

describe UsersFavoriteBrewery, type: :model do
  context 'relationships' do
      it { should belong_to(:favorite_brewery) }
      it { should belong_to(:user) }
  end
end
