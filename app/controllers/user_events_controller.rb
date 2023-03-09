class UserEventsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @events = @user.user_events
    @future_events = @user.requests.where(status: 'approved').map(&:event).select{ |event| event.start_time >= Time.current }
    @past_events = @user.requests.where(status: 'approved').map(&:event).select{ |event| event.start_time < Time.current }
  end
end
