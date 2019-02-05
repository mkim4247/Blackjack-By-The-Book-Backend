class Api::V1::AuthController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: {
        message: "valid",
        user_info: @user,
        error: false,
        token: encode({ user_id: @user.id })
      }, status: :accepted
    else
      render json: {
        message: "unauthorized",
        error: true
      }, status: :unauthorized
    end
  end

  private 

  def login_params
    params.require(:user).permit(:username, :password)
  end


end
