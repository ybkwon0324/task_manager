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

ActiveRecord::Schema.define(version: 20150730045247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "point"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "work_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.string   "content_detail"
    t.boolean  "completion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.integer  "entire_percent"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
