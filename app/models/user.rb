class User < ApplicationRecord
  has_many :review_requests, :likes, :bookmarks, :response_reviews
  validates :name, presence: true, uniqueness: true
end
