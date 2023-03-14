class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  # GET /events or /events.json
  def index
    @events = Event.all
    if params[:query].present?
      @events = Event.global_search(params[:query])
    else
      @events = Event.all
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "events/info_window_html", locals: {event: event}),
        # Passes the flat to the partial
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @movie = Movie.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.movie = Movie.find(event_params[:movie_id])
    @event.user = current_user
    if @event.save
      redirect_to event_url(@event), notice: "Event was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to event_url(@event), notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :language,
      :max_registrations,
      :address,
      :latitude,
      :longitude,
      :start_time,
      :end_time,
      :movie_id,
      :photo
    )
  end
end
