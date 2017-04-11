class CategoriesController < ApplicationController
  attr_reader :category
  before_action :set_category, only: [:show, :index]

  def index
    @categories = category.all
  end

  private

  def set_category
    @category = Category.new
  end

end
