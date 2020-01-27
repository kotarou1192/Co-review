class CreateReviewRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :review_requests do |t|
      t.string :user_id
      t.string :title
      t.string :text
      t.boolean :is_open

      t.timestamps
    end
  end
end
