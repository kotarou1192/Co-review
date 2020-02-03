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

ActiveRecord::Schema.define(version: 2020_01_28_065144) do

  create_table "review_requests", force: :cascade do |t|
    t.string "user_id"
    t.string "title", null: false
    t.string "text", null: false
    t.boolean "is_open", default: true
    t.integer "review_count", default: 0
    t.string "tag_1"
    t.boolean "tag_1_is_frozen", default: false
    t.string "tag_2"
    t.boolean "tag_2_is_frozen", default: false
    t.string "tag_3"
    t.boolean "tag_3_is_frozen", default: false
    t.string "tag_4"
    t.boolean "tag_4_is_frozen", default: false
    t.string "tag_5"
    t.boolean "tag_5_is_frozen", default: false
    t.string "tag_6"
    t.boolean "tag_6_is_frozen", default: false
    t.string "tag_7"
    t.boolean "tag_7_is_frozen", default: false
    t.string "tag_8"
    t.boolean "tag_8_is_frozen", default: false
    t.string "tag_9"
    t.boolean "tag_9_is_frozen", default: false
    t.string "tag_10"
    t.boolean "tag_10_is_frozen", default: false
    t.string "request_status", default: "free"
    t.string "postscript"
    t.boolean "is_frozen_by_admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text"], name: "index_review_requests_on_text", unique: true
    t.index ["title"], name: "index_review_requests_on_title", unique: true
  end

end
