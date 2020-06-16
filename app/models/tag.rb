class Tag < ApplicationRecord
  belongs_to :review_request
  validates :name, presence: true, length: { maximum: 16 }
end
