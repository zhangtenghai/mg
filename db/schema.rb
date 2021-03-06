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

ActiveRecord::Schema.define(version: 20150413064437) do

  create_table "adverts", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "list_img"
    t.datetime "disabled_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "posted_at"
    t.string   "quote"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
    t.string   "category"
    t.string   "topic"
    t.string   "summary",     limit: 500
    t.string   "avatar"
    t.string   "head_img"
  end

  create_table "articles_user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.datetime "posted_at"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
    t.integer  "news_id"
    t.integer  "article_id"
    t.integer  "game_id"
  end

  create_table "descriptions", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.decimal  "sale_price",              precision: 10, scale: 0
    t.string   "rating"
    t.decimal  "avg_score",               precision: 10, scale: 0
    t.datetime "sale_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
    t.decimal  "score",                   precision: 10, scale: 0
    t.string   "summary",     limit: 500
    t.string   "sale_unit"
    t.string   "avatar"
    t.string   "head_img"
    t.string   "list_img"
  end

  create_table "games_user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_user_scores", force: true do |t|
    t.decimal "score",   precision: 5, scale: 2
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "posted_at"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "disabled_at"
    t.boolean  "is_head"
    t.string   "summary",     limit: 500
    t.string   "list_img"
    t.string   "head_img"
  end

  create_table "news_user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
    t.string   "pet_name"
    t.string   "weibo"
    t.string   "qq"
    t.string   "signature"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voices", force: true do |t|
    t.string   "content"
    t.string   "user_name"
    t.string   "user_title"
    t.datetime "disabled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

end
