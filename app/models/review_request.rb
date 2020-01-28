class ReviewRequest < ApplicationRecord
  validates :title, presence: true, length: { maximum: 120 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 2000 }, uniqueness: true
end
