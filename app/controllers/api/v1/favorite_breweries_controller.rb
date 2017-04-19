class Api::V1::FavoriteBreweriesController < ApplicationController

  def index
    brewery= Brewery.new
    render json: brewery.get_user_favorite(params[:id])
  end
end
