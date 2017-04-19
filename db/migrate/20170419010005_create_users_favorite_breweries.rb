class CreateUsersFavoriteBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :users_favorite_breweries do |t|
      t.references :user, foreign_key: true
      t.references :favorite_brewery, foreign_key: true

      t.timestamps
    end
  end
end
