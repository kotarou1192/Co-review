class ReviewRequest < ApplicationRecord
  has_many :tag, dependent: :destroy
  validates :title, presence: true, length: { maximum: 120 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 2000 }, uniqueness: true
end
