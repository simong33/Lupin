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

ActiveRecord::Schema.define(version: 20170905124006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "friends_count"
    t.string   "followers_count"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "nickname"
    t.boolean  "active"
    t.string   "image"
    t.string   "uid"
    t.index ["user_id"], name: "index_competitors_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_follows_on_target_id", using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "friends_count"
    t.string   "followers_count"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "nickname"
    t.integer  "competitor_id"
    t.string   "uid"
    t.string   "image"
    t.index ["competitor_id"], name: "index_targets_on_competitor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "name"
    t.string   "location"
    t.string   "image"
    t.string   "description"
    t.string   "token"
    t.string   "secret"
    t.string   "background_image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "competitors", "users"
  add_foreign_key "follows", "targets"
  add_foreign_key "follows", "users"
  add_foreign_key "targets", "competitors"
end
