class Movie < ApplicationRecord
  has_many :events
  has_one_attached :photo
  validates :title, :overview, presence: true
end
