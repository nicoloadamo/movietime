class Movie < ApplicationRecord
  has_many :events

  validates :title, :overview, presence: true
end
