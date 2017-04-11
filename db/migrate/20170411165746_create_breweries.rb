class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :bid
      t.string :name
      t.string :image_url
      t.string :location_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :web_site
      t.string :category
      t.string :open?
    end
  end
end
