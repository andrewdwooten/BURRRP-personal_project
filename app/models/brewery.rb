class Brewery < OpenStruct
  attr_reader :tap

  def tap
    @tap = BreweryService.new
  end

  def get_by_page(page)
    raw_breweries = tap.get_breweries(page)
    self.organize_breweries(raw_breweries)
  end

  def organize_breweries(raw_breweries)
    raw_breweries.delete_if {|brewery| !brewery.has_key?(:images)}
    raw_breweries.map do |brewery|
      Brewery.new(id:           brewery[:id],
                  name:         brewery[:name],
                  description:  brewery[:description],
                  image:        brewery[:images][:squareMedium],
                  website:      brewery[:website])
    end
  end

  def get_brewery(id)
    raw_brewery = tap.get_brewery(id)
    location = raw_brewery[:locations].first
    Brewery.new(id:           raw_brewery[:id],
                name:         raw_brewery[:name],
                description:  raw_brewery[:description],
                image:        raw_brewery[:images][:squareMedium],
                website:      raw_brewery[:website],
                street:       location[:streetAddress],
                city:         location[:locality],
                state:        location[:region],
                phone:        location[:phone],
                kind:         location[:locationTypeDisplay])
  end

  def search_by_city(city)
    raw_breweries = tap.search_by_city(city)
    build_json_breweries(raw_breweries)
  end

  def build_json_breweries(raw_breweries)
    raw_breweries.delete_if {|brewery| !brewery[:brewery].has_key?(:images)}
    raw_breweries.map do |brewery|
                 {id:           brewery[:brewery][:id],
                  name:         brewery[:brewery][:name],
                  street:       brewery[:streetAddress],
                  city:         brewery[:locality],
                  state:        brewery[:region],
                  zip:          brewery[:postalCode],
                  phone:        brewery[:phone],
                  website:      brewery[:brewery][:website],
                  kind:         brewery[:locationTypeDisplay],
                  image:        brewery[:brewery][:images][:squareMedium]}
    end
  end
end
