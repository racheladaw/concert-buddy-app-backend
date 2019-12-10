module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          render json: UserSerializer.new(@user)
        else
          render json: {
            error: "Invalid Credentials"
          }
        end
      end

      def getCurrentUser
        if logged_in?
          render json: UserSerializer.new(current_user)
        else
          render json: {
            error: "You are not logged in"
          }
        end
      end

      def destroy
        session.clear
        render json: {
          notice: "You are now logged out"
        }, status: :ok
      end

    end
  end
end 
