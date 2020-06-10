class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      # { on_delete: :cascade }
      # 参照先が削除されたら、そこを参照しているレコードも削除されるオプション
      t.references :user, nil: false, foreign_key: { on_delete: :cascade }
      t.references :review_request, nil: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
