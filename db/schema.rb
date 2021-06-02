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

ActiveRecord::Schema.define(version: 2021_06_01_105146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.string "category"
    t.boolean "pending", default: false
    t.boolean "cancel", default: false
    t.boolean "accepted", default: false
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.string "info"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "category"
    t.string "password_digest"
    t.string "location"
    t.string "age"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.string "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "favorites", array: true
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "users"
end
