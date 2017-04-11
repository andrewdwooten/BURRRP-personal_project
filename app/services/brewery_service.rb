class BreweryService
  attr_reader :connection, :auth, :output, :location, :breweries, :page

  def initialize
    @connection = Faraday.new("http://api.brewerydb.com")
    @auth = "?key=#{ENV['API_KEY']}"
    @output = "format=json"
    @location = "withLocations=Y"
    @breweries = []
    @page = 1
  end

  def get_categories
    parse(connection.get("/v2/categories#{auth}&#{output}"))
  end

  def get_breweries(page)
    response = parse(connection.get("/v2/breweries#{auth}&#{location}&status=verified&p=#{page}&#{output}"))
    response[:data]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
