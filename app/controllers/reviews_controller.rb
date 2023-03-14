class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @event = Event.find(params[:event_id])
    reviewed_users
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @event = Event.find(params[:event_id])
    @review = Review.find_by(event_id: @event.id, reviewer_id: current_user.id, user_id: review_params[:user_id])
    if @review.nil?
      @review = Review.new(review_params)
      @review.event = @event
      @review.reviewer_id = current_user.id
      if @review.save
        redirect_to(event_path(@event), notice: "🎉 Congrats! Your just reviewed #{@review.user.nickname} on #{@event.name}.")
      else
        reviewed_users
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to event_reviews_path(current_user), notice: "💫 It seems you have already reviewed this participant."
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully deleted." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :event_id, :reviewer_id)
  end

  def reviewed_users
    users_reviewed = @event.reviews.where(reviewer: current_user).map(&:user)
    excluded_users = [current_user] + users_reviewed
    @users = @event.requests.where(status: 'accepted').where.not(user: excluded_users).map(&:user)
  end
end
