class BreweryService
  attr_reader :connection,
              :auth,
              :output,
              :location,
              :breweries,
              :page,
              :location_search

  def initialize
    @connection = Faraday.new("http://api.brewerydb.com")
    @auth = "?key=#{ENV['API_KEY']}"
    @output = "format=json"
    @location = "withLocations=Y"
    @breweries = []
    @page = 1
    @location_search = "#{auth}&type=brewery&#{output}&inPlanning=N&isPrimary=Y"
  end

  def get_categories
    parse(connection.get("/v2/categories#{auth}&#{output}"))
  end

  def get_breweries(page)
    response = parse(connection.get("/v2/breweries#{auth}&#{location}&status=verified&p=#{page}&#{output}"))
    response[:data]
  end

  def get_brewery(id)
    response = parse(connection.get("/v2/breweries#{auth}&#{location}&status=verified&ids=#{id}&#{output}"))
    brewery = response[:data].first
  end

  def get_brewery_beers(id)
    beers = parse(connection.get("/v2/brewery/#{id}/beers#{auth}&#{output}"))
    beers[:data]
  end

  def search_by_city(city)
    breweries = parse(connection.get("/v2/locations#{auth}&#{location_search}&locality=#{city}"))
    breweries[:data]
  end
  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
