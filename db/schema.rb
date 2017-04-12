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

ActiveRecord::Schema.define(version: 20170412013804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "receiver_id"
    t.integer  "meal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["meal_id"], name: "index_gifts_on_meal_id", using: :btree
    t.index ["provider_id"], name: "index_gifts_on_provider_id", using: :btree
    t.index ["receiver_id"], name: "index_gifts_on_receiver_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.string   "title"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provider_id"], name: "index_meals_on_provider_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
