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

ActiveRecord::Schema[7.0].define(version: 2023_05_21_095538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id"
    t.string "client_name", default: "client name"
    t.string "client_location", default: "location"
    t.integer "client_contact"
    t.bigint "performer_id"
    t.string "performer_name", default: "performer name"
    t.string "performer_location", default: "location"
    t.string "performer_contact", default: "phone"
    t.string "performer_accepted", default: "pending"
    t.bigint "service_id"
    t.string "service_name", default: "service name"
    t.string "duration", default: "duration"
    t.integer "fee"
    t.date "booking_date"
    t.time "booking_time"
    t.string "transaction_status", default: "incomplete"
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
    t.integer "fee"
    t.integer "duration"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
