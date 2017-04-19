class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :check_page?, :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_page?
    params[:brewery_page].nil? || params[:brewery_page].to_i < 1
  end

  def authorize!
    unless current_user
      flash[:danger] = "Log in with Twitter to access that feature."
      redirect_to root_path
    end
  end
end
