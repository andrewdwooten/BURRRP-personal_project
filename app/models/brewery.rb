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
end
