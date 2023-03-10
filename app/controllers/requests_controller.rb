class RequestsController < ApplicationController
  before_action :set_request, only: %i[ new show edit update destroy accept reject]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
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
  end

  def reject
    @request.update(status: 'rejected')
  end

  # POST /requests or /requests.json
  def create
    @event = Event.find(params[:event_id])
    @request = Request.new(event: @event, user: current_user, status: :pending)
    respond_to do |format|
      if @request.save
        format.html { redirect_to event_url(@event), notice: "Your request has been sent" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
