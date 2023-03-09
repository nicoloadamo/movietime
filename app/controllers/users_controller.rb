class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # def index
  #   @users = User.all
  # end

  def show
  end

  # def update
  #   @user.update(user_params)
  #   redirect_to user_path(@user)
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # def user_params
  #   params.require(:user).permit(:biography, :nickname, :user_id)
  # end
end
