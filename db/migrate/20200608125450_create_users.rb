class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :icon_url
      t.string :remember_digest
      t.timestamps
    end
  end
end
