class Event < ApplicationRecord
  # belongs_to :movie

  # this line should be reviewd:
  has_one :movie
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :name, :description, :language, :address, :start_time, :end_time, :max_registrations, presence: true
  validates :name, length: { minimum: 10, maximum: 60 }
  validates :description, length: { minimum: 10, maximum: 300 }
end
