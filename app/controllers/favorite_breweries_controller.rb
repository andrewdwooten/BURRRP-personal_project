class FavoriteBreweriesController < ApplicationController

  def show
    brewery = FavoriteBrewery.find_or_create_by(uid: params[:id])
    current_user.users_favorite_breweries.create(favorite_brewery: brewery)
    flash[:success] = "Brewery added to your favorites!"
    redirect_to request.referrer
  end
end
