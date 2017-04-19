class FavoriteBrewery < ApplicationRecord
  has_many :users_favorite_breweries
  validates_uniqueness_of :uid
end
