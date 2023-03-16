class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show
    @requests = current_user.requests.where(status: 'accepted')
    @events = @requests.map do |request|
      Event.find(request.event_id)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
