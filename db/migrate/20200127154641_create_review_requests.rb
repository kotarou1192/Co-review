class CreateReviewRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :review_requests do |t|
      t.string :user_id, default: 'guest'
      t.string :title, null: false
      t.string :text, null: false
      t.boolean :is_open, default: true

      t.timestamps
    end
  end
end
