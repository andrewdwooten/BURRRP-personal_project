class UsersFavoriteBrewery < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_brewery
end
