class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def index
    render 'index'
  end

  def current_user
    puts "finding current user"
    puts session[:user_id]
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
