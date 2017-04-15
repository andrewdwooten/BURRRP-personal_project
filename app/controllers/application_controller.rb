class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_page, :check_page

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_page
    if params[:brewery_page].nil?
      1
    else
      params[:brewery_page].to_i
    end
  end

  def check_page?
     params[:brewery_page].nil? || params[:brewery_page].to_i < 1
  end
end
