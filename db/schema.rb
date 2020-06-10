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

ActiveRecord::Schema.define(version: 2020_06_09_132315) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_request_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_request_id"], name: "index_bookmarks_on_review_request_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "response_review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["response_review_id"], name: "index_likes_on_response_review_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "response_reviews", force: :cascade do |t|
    t.integer "review_request_id"
    t.text "text"
    t.boolean "favorite", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_request_id"], name: "index_response_reviews_on_review_request_id"
  end

  create_table "review_requests", force: :cascade do |t|
    t.text "title", limit: 120, null: false
    t.text "text", limit: 2000, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "additional_remark", limit: 500
    t.integer "status", limit: 1
    t.integer "user_id"
    t.index ["text"], name: "index_review_requests_on_text", unique: true
    t.index ["title"], name: "index_review_requests_on_title", unique: true
    t.index ["user_id"], name: "index_review_requests_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 16
    t.boolean "pinned", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "review_request_id"
    t.index ["review_request_id"], name: "index_tags_on_review_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "name"
    t.string "icon_url"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookmarks", "review_requests", on_delete: :cascade
  add_foreign_key "bookmarks", "users", on_delete: :cascade
  add_foreign_key "likes", "response_reviews", on_delete: :cascade
  add_foreign_key "likes", "users", on_delete: :cascade
  add_foreign_key "response_reviews", "review_requests", on_delete: :cascade
  add_foreign_key "review_requests", "users", on_delete: :cascade
  add_foreign_key "tags", "review_requests", on_delete: :cascade
end
