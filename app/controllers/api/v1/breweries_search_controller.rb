class Api::V1::BreweriesSearchController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    brewery = Brewery.new
    render json: brewery.search_by_city(params['brewery_city'])
  end
end
