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

ActiveRecord::Schema.define(version: 20180503201826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holiday_albums", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "rating"
    t.bigint "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_id"], name: "index_holiday_albums_on_holiday_id"
  end

  create_table "holiday_invites", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_id"], name: "index_holiday_invites_on_holiday_id"
    t.index ["user_id"], name: "index_holiday_invites_on_user_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_holidays_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.text "caption"
    t.integer "rating"
    t.bigint "holiday_album_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_album_id"], name: "index_photos_on_holiday_album_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "photo"
    t.date "birth_date"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "holiday_albums", "holidays"
  add_foreign_key "holiday_invites", "holidays"
  add_foreign_key "holiday_invites", "users"
  add_foreign_key "holidays", "users"
  add_foreign_key "photos", "holiday_albums"
  add_foreign_key "photos", "users"
end
