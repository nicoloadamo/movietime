class Review < ApplicationRecord
  belongs_to :event
  # this line is linked to the user model instructions  lines: 11 - 12
  belongs_to :user
  belongs_to :reviewer, class_name: "User"

  validates :comment, :rating, presence: true
  validates :comment, length: { minimum: 2, maximum: 250 }
end
