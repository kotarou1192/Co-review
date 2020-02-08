# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_08_014616) do

  create_table "review_requests", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", null: false
    t.string "text", null: false
    t.boolean "is_open", default: true
    t.integer "review_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "request_status"
    t.string "additional_remark"
    t.boolean "is_frozen", default: false
    t.index ["text"], name: "index_review_requests_on_text", unique: true
    t.index ["title"], name: "index_review_requests_on_title", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.integer "request_id"
    t.boolean "is_pinned", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
