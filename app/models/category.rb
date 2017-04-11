class Category < OpenStruct
  attr_reader :tap

  def tap
    @tap = BreweryService.new
  end

  def all
    raw_categories = tap.get_categories
    self.organize_all(raw_categories)
  end

  def organize_all(raw_categories)
    raw_categories[:data].map do |category|
      Category.new(id:    category[:id],
                   name:  category[:name])
    end
  end

end
