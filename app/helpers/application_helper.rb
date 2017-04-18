module ApplicationHelper

  def current_page
    if params[:brewery_page].nil?
      1
    else
      params[:brewery_page].to_i
    end
  end

end
