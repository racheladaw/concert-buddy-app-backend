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

  def uploadPhoto
    @user = User.find(profile_picture_params[:id])
    # need functionality to take file from params and add photo to database

    @user.profile_picture.attach(profile_picture_params[:profile_picture])

    if @user.profile_picture.attached?
      profile_picture_serializer = ProfilePictureSerializer.new(profile_picture: @user.profile_picture, user: @user)
      render json: profile_picture_serializer.serialize_new_profile_picture()
    else
      render json: {errors: "No profile picture attached"}, status: 400
    end
  end

  def show
    @user = User.find(params[:id])

    if @user
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: {error: "User unable to be found"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def profile_picture_params
    params.permit(:profile_picture, :id)
  end

end
