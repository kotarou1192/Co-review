class AddIndexToReviewRequests < ActiveRecord::Migration[6.0]
  def change
    add_index :review_requests, :title, unique: true
    add_index :review_requests, :text, unique: true
  end
end
