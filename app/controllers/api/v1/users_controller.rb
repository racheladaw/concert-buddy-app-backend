class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    users_json = UserSerializer.new(@users).serialized_json
    render json: users_json
  end

  def create
    @user = User.new(user_params)
    location = Location.find_or_create_by(city: params[:user][:location][:city], state: params[:user][:location][:state], country: params[:user][:location][:country])
    @user.location = location
    
    if @user.save
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user).serialized_json, status: :created
    else
      response = {
        error: @user.errors.full_messages.to_sentence
      }
      render json: response, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
