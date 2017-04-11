require 'rails_helper'

describe 'Category' do
  it '#all' do
    VCR.use_cassette('models/category/all') do
      category = Category.new
      categories = category.all
      first = categories.first

      expect(categories.count).to eq(15)
      expect(first).to respond_to(:name)
      expect(first).to respond_to(:id)
      expect(first.class).to eq(Category)
    end
  end
end
