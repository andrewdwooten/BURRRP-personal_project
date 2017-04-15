class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    flash[:success] = "Login Successful. Welcome to BURRP!!"
    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:success] = "Successful logout. Come back soon!"
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
