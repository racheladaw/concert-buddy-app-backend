class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      render json: @user
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def delete

  end
end
