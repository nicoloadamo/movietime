class Event < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
