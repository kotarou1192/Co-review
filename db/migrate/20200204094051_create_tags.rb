class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.integer :request_id
      t.boolean :is_pinned, default: false

      t.timestamps
    end
  end
end
