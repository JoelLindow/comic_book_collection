# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170719010147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "issue_number"
    t.text "description"
    t.string "img_url"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_books_on_brand_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_books", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "books_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["books_id"], name: "index_users_books_on_books_id"
    t.index ["users_id"], name: "index_users_books_on_users_id"
  end

  add_foreign_key "books", "brands"
  add_foreign_key "users_books", "books", column: "books_id"
  add_foreign_key "users_books", "users", column: "users_id"
end
