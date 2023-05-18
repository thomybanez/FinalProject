# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_17_140543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id"
    t.boolean "client_paid"
    t.bigint "performer_id"
    t.boolean "performer_accepted"
    t.bigint "service_id"
    t.string "transaction_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["performer_id"], name: "index_bookings_on_performer_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "contact_number"
    t.string "nick_name"
    t.integer "age"
    t.string "gender"
    t.string "location"
    t.float "spent_amount"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "contact_number"
    t.string "stage_name"
    t.integer "age"
    t.string "gender"
    t.string "location"
    t.text "description"
    t.float "ratings"
    t.boolean "availability"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "category"
    t.string "service_name"
    t.integer "rate_hour"
    t.integer "no_hour"
    t.bigint "performer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performer_id"], name: "index_services_on_performer_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "balance"
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_wallets_on_owner"
  end

end
