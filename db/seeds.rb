class Seed
  attr_reader :tap

  def initialize
    @tap = BreweryService.new
  end

  def load_breweries
    raw_breweries = tap.get_breweries
    create_breweries(raw_breweries)
  end

  def create_breweries(raw_breweries)
    raw_breweries.each do |brewery|
      Brewery.create(bid:              brewery[:id],
                      name:             brewery[:name],
                      image_url:        brewery[:images][:squareMedium],
                      location_name:    brewery[:locations].first[:name],
                      street_address:   brewery[:locations].first[:streetAddress],
                      city:             brewery[:locations].first[:locality],
                      state:            brewery[:locations].first[:region],
                      zip:              brewery[:locations].first[:phone],
                      web_site:         brewery[:locations].first[:website],
                      category:         brewery[:locations].first[:locationTypeDisplay],
                      open?:            brewery[:locations].first[:openToPublic])
      puts "Created #{Brewery.last.name}; it's in #{Brewery.last.state} alongside
            is a #{Brewery.last.category}."
    end
  end
end

seed = Seed.new
seed.load_breweries
