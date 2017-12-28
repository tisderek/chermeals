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

ActiveRecord::Schema.define(version: 20171121064356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", id: :serial, force: :cascade do |t|
    t.integer "provider_id"
    t.integer "receiver_id"
    t.integer "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_gifts_on_meal_id"
    t.index ["provider_id"], name: "index_gifts_on_provider_id"
    t.index ["receiver_id"], name: "index_gifts_on_receiver_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "invite_url"
    t.string "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", id: :serial, force: :cascade do |t|
    t.string "main_title"
    t.string "vendor"
    t.date "expected_date"
    t.integer "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_meals_on_provider_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "group_id"
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
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

end
