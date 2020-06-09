class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, nil: false, foreign_key: { on_delete: :cascade }
      t.references :response_review, nil: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
