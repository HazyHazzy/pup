# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_225204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeders", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "about_us"
    t.string "website_url"
    t.string "email"
    t.string "phone_number"
    t.string "user_id"
    t.string "references"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "health_issues"
    t.integer "activity_level"
    t.string "coats"
    t.integer "family_friendly"
    t.integer "trainability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "minimum_weight"
    t.integer "maximum_weight"
    t.integer "minimum_life_span"
    t.integer "maximum_life_span"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.string "coat"
    t.string "description"
    t.string "gender"
    t.bigint "breed_id", null: false
    t.bigint "breeder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breed_id"], name: "index_parents_on_breed_id"
    t.index ["breeder_id"], name: "index_parents_on_breeder_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parents", "breeders"
  add_foreign_key "parents", "breeds"
end
