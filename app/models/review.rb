class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :reviewer, class_name: "User"

  validates :comment, :rating, presence: true
  validates :comment, length: { minimum: 20, maximum: 500 }
end
