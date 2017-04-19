class UsersController < ApplicationController
  before_action :authorize!

  def show
    @user = current_user
    gon.favorite_breweries_ids = current_user.favorite_breweries_ids
  end
end
