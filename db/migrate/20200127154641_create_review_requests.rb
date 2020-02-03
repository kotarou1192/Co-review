class CreateReviewRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :review_requests do |t|
      t.string :user_id
      t.string :title, null: false
      t.string  :text, null: false
      t.boolean :is_open, default: true
      t.integer :review_count, default: 0
      t.string :tag_1
      t.boolean :tag_1_is_frozen, default: false
      t.string :tag_2
      t.boolean :tag_2_is_frozen, default: false
      t.string :tag_3
      t.boolean :tag_3_is_frozen, default: false
      t.string :tag_4
      t.boolean :tag_4_is_frozen, default: false
      t.string :tag_5
      t.boolean :tag_5_is_frozen, default: false
      t.string :tag_6
      t.boolean :tag_6_is_frozen, default: false
      t.string :tag_7
      t.boolean :tag_7_is_frozen, default: false
      t.string :tag_8
      t.boolean :tag_8_is_frozen, default: false
      t.string :tag_9
      t.boolean :tag_9_is_frozen, default: false
      t.string :tag_10
      t.boolean :tag_10_is_frozen, default: false
      t.string :request_status, default: 'free'
      t.string :postscript
      t.boolean :is_frozen_by_admin, default: false

      t.timestamps
    end
  end
end
