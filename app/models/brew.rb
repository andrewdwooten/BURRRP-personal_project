class Brew < OpenStruct
  attr_reader :tap

  def tap
    @tap = BreweryService.new
  end

  def all_at_brewery(id)
    raw_beers = tap.get_brewery_beers(id)
    if raw_beers.nil?
      []
    else
      build_brew_objects(raw_beers)
    end
  end

  def build_brew_objects(raw_beers)
    raw_beers.map do |brew|
      Brew.new(id:             brew[:id],
               name:           brew[:nameDisplay],
               description:    brew[:description],
               organic?:       brew[:isOrganic])
    end
  end
end
