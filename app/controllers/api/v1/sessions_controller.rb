class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def getCurrentUser
    if logged_in?
      render json: current_user
    else
      render json: {
        error: "You are not logged in"
      }
    end
  end

  def delete

  end
end
