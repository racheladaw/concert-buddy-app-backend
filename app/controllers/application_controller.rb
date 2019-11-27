class ApplicationController < ActionController::API
  def current_user
    #mocked version of being logged in
    User.first
  end

  def logged_in?
    !!current_user
  end
end
