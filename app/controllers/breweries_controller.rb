class BreweriesController < ApplicationController
  attr_reader :brewery_place, :brewer
  before_action :set_brewery, only: [:index, :show]
  before_action :set_brew, only: [:show]

  def index
    if params[:brewery_page].nil?
      @breweries = brewery_place.get_by_page(1)
    else
      @breweries = brewery_place.get_by_page(params[:brewery_page])
    end
  end

  def show
    @brewery = brewery_place.get_brewery(params[:id])
    @brews   = brewer.all_at_brewery(params[:id])
  end

  private

  def set_brewery
    @brewery_place = Brewery.new
  end

  def set_brew
    @brewer = Brew.new
  end

end
