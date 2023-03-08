class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
