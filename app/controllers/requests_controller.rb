class RequestsController < ApplicationController
  before_action :set_request, only: %i[ new show edit update destroy accept reject]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
    @event = @request.event
  end

  # GET /requests/new
  def new
    @event = Event.new
  end

  # GET /requests/1/edit
  def edit
  end

  # Default status of a request is 'pending'
  def pending
    return true
  end

  def accept
    @request.update(status: 'accepted')
    redirect_to @request.event, notice: "🎉 Congrats! You have accepted the request"
  end

  def reject
    @request.update(status: 'rejected')
    redirect_to @request.event, notice: "🎉 Congrats! You have rejected the request"
  end

  # POST /requests or /requests.json
  def create
    @event = Event.find(params[:event_id])
    @request = Request.find_by(user_id: current_user.id, event_id: @event.id)
    if @request.nil?
      respond_to do |format|
        @request = Request.new(event: @event, user: current_user, status: :pending)
        if @request.save
          format.html { redirect_to(user_request_path(current_user, @request),
            notice: "🎉 Congrats! Your request has been sent to the host") }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    else
      redirect_to user_requests_path(current_user),
        notice: "💫 It seems you have already applied to the event, find it here below."
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Your request was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Your request is destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:status, :event_id, :user_id)
  end
end
