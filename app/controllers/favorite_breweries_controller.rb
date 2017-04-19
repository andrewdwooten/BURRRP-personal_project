class FavoriteBreweriesController < ApplicationController

  def show
    brewery = FavoriteBrewery.find_or_create_by(uid: params[:id])
    add_user_favorite_brewery(brewery)
    redirect_to request.referrer
  end

  private
  def add_user_favorite_brewery(brewery)
    if current_user.favorite_breweries_ids.include?(brewery.uid)
      flash[:success] = "That brewery is already in your favorites!"
    else
      current_user.users_favorite_breweries.create(favorite_brewery: brewery)
      flash[:success] = "Brewery added to your favorites!"
    end
  end
end
