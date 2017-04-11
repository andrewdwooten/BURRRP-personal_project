class BreweryService
  attr_reader :connection, :auth, :output

  def initialize
    @connection = Faraday.new("http://api.brewerydb.com")
    @auth = "?key=#{ENV['API_KEY']}"
    @output = "format=json"
  end

  def get_categories
    parse(connection.get("/v2/categories#{auth}&#{output}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
