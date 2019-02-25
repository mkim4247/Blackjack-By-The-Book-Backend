class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {
        user: UsersSerializer.new(@user),
        message: "created",
        user_info: @user,
        error: false,
        token: encode({ user_id: @user.id })
      }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def profile
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user_id = payload["user_id"]
    render json: { user: User.find(user_id) }, status: :accepted
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :pot, :longest_streak, :current_streak, :largest_pot)
  end

end
