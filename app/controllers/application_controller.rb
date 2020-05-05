class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def index
    Hello World
  end 

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
