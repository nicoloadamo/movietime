class Event < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :reviews
  has_one_attached :photo
  # has_many :events, dependent: :nullify
  geocoded_by :address

  validates :name, :description, :language, :address, :start_time, :end_time, :max_registrations, presence: true
  validates :name, length: { minimum: 5, maximum: 40 }
  validates :description, length: { minimum: 5, maximum: 300 }

  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :global_search,
  against: %i[name description language address],
  associated_against: {
    movie: %i[title overview genre]
  },
  using: {
    tsearch: { prefix: true }
  }

  def location_photo
    if photo.attached?
      photo.key
    else
      "twy6ywnkkwp2do8n8pic.jpg"
    end
  end

  def all_participants
    requests.where(status: "accepted")
  end

  def all_user_received_reviews
    all_participants.each { |request| request.user.received_reviews }
  end

  def pending_requests
    requests.where(status: "pending")
  end
end
