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

ActiveRecord::Schema.define(version: 2022_09_19_213540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_recommendations", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.bigint "blog_id"
    t.index ["blog_id"], name: "index_book_recommendations_on_blog_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_id"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "movie_recommendations", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.bigint "blog_id"
    t.index ["blog_id"], name: "index_movie_recommendations_on_blog_id"
  end

  add_foreign_key "book_recommendations", "blogs"
  add_foreign_key "comments", "blogs"
  add_foreign_key "movie_recommendations", "blogs"
end
