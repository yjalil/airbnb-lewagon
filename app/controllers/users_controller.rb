class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  # create action
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  # update action
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  # delete action
  def destroy
    @user.destroy
    redirect_to user_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :hour_rate, :role)
  end
end
