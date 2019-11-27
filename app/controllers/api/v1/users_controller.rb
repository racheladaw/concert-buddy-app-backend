class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    users_json = UserSerializer.new(@users).serialized_json
    render json: users_json
  end

end
