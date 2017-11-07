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

ActiveRecord::Schema.define(version: 20171107104936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "charity_type"
    t.string "charity_name"
    t.string "address"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "charity_id"
    t.datetime "pickup_date"
    t.string "pickup_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_id"], name: "index_deliveries_on_charity_id"
  end

  create_table "foods", force: :cascade do |t|
    t.bigint "delivery_id"
    t.bigint "supporter_id"
    t.string "name"
    t.string "quantity"
    t.string "description"
    t.string "type"
    t.date "mfg_date"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_foods_on_delivery_id"
    t.index ["supporter_id"], name: "index_foods_on_supporter_id"
  end

  create_table "supporters", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "org_name"
    t.string "org_type"
    t.string "address"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
