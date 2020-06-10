class ChangeColumnOfTags < ActiveRecord::Migration[6.0]
  def up
    change_table :tags do |t|
      t.remove :request_id
      t.rename :tag_name, :name
      t.change :name, :string, limit: 16
      t.references :review_request, foreign_key: { on_delete: :cascade }
    end
  end

  def down
    change_table :tags do |t|
      t.remove :review_request_id
      t.integer :request_id
      t.rename :name, :tag_name
      t.change :tag_name, :string, limit: false
    end
  end
end
