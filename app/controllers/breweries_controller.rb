class BreweriesController < ApplicationController
  attr_reader :brewery
  before_action :set_brewery, only: [:index]

  def index
    if params[:brewery_page].nil?
      @breweries = @brewery.get_by_page(1)
    else
      @breweries = @brewery.get_by_page(params[:brewery_page])
    end
  end

  private
  def set_brewery
    @brewery = Brewery.new
  end

end
