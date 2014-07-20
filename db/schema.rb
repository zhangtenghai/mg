# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140719040107) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "content"
    t.datetime "posted_at"
    t.string   "quote"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
  end

  create_table "articles_user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.datetime "posted_at"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
  end

  create_table "game_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "origin_name"
    t.string   "developer"
    t.string   "website"
    t.string   "publisher"
    t.decimal  "sale_price",  precision: 10, scale: 0
    t.string   "rating"
    t.decimal  "avg_score",   precision: 10, scale: 0
    t.datetime "sale_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "posted_at"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.datetime "locked_at"
    t.string   "unlock_token"
    t.datetime "disabled_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
