class V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    user = ActiveModelSerializers::SerializableResource.new(user, option)
    render json: {user: user, age: 1}
  end

  def create
    user = User.new user_params
    if user.save
      render json: format_response("Request Ok", ActiveModelSerializers::SerializableResource.new(user, option))
    else
      render json: format_response_error(user.errors.messages)
    end
  end

  private

  def user_params
    params.require(:user).permit User::USERS_PARAMS
  end
end
