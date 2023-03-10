class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests # requests as a client
  has_many :requests_as_owner, through: :events, source: :events, dependent: :destroy
  has_many :events
  has_one_attached :photo, dependent: :destroy

  def avatar
    if photo.attached?
      photo.key
    else
      "logo2.png"
    end
  end

  #with this notation we are giving explicitly the roles to users
  #this line is linked to the user model instructions  lines: 11 - 12
  has_many :received_reviews, foreign_key: :user_id, class_name: "Review"
  has_many :given_reviews, foreign_key: :reviewer_id, class_name: "Review"

  def user_events
    requests.each do |request|
      request.event
    end
  end
end
