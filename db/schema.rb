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

ActiveRecord::Schema.define(version: 2019_10_16_122619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invites", force: :cascade do |t|
    t.string "category"
    t.string "time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "invite_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_id"], name: "index_plans_on_invite_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.string "city"
    t.string "occupation"
    t.string "company"
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plans", "invites"
  add_foreign_key "plans", "users"
end
