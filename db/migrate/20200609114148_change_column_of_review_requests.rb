class ChangeColumnOfReviewRequests < ActiveRecord::Migration[6.0]
  def up
    change_table :review_requests do |t|
      t.remove :is_open, :review_count, :request_status, :is_frozen, :user_id
      # integer limit 1 -> tinyint(4) (mysqlの場合)
      t.integer :status, limit: 1
      t.change :title, :text, limit: 120
      t.change :text, :text, limit: 2000
      t.change :additional_remark, :text, limit: 500
      t.references :user, foreign_key: { on_delete: :cascade }
    end
  end

  def down
    change_table :review_requests do |t|
      t.remove :status, :user_id
      t.integer :user_id
      t.boolean :is_open, default: true
      t.integer :review_count, default: 0
      t.string :request_status
      t.change :title, :string, limit: false
      t.change :text, :string, limit: false
      t.change :additional_remark, :string, limit: false
      t.boolean :is_frozen, default: false
    end
  end
end
