class CreateResponseReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :response_reviews do |t|
      t.references :review_request, foreign_key: { on_delete: :cascade }
      t.text :text
      t.boolean :favolite, default: false
      t.timestamps
    end
  end
end
