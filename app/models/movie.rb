class Movie < ApplicationRecord
  belongs_to :event

  validates :title, :overview, presence: true
end
