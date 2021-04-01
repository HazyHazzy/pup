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

ActiveRecord::Schema.define(version: 2021_04_01_210837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breed_breeders", force: :cascade do |t|
    t.bigint "breed_id", null: false
    t.bigint "breeder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breed_id"], name: "index_breed_breeders_on_breed_id"
    t.index ["breeder_id"], name: "index_breed_breeders_on_breeder_id"
  end

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
    t.integer "guardian_insticts"
    t.integer "grooming_requirements"
    t.string "origin"
  end

  create_table "litters", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.bigint "breeder_id", null: false
    t.bigint "stud_id"
    t.bigint "mom_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breeder_id"], name: "index_litters_on_breeder_id"
    t.index ["mom_id"], name: "index_litters_on_mom_id"
    t.index ["stud_id"], name: "index_litters_on_stud_id"
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

  create_table "puppies", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "weight"
    t.string "coat"
    t.bigint "breed_id", null: false
    t.bigint "litter_id", null: false
    t.index ["breed_id"], name: "index_puppies_on_breed_id"
    t.index ["litter_id"], name: "index_puppies_on_litter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "breeder_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "home_address"
    t.string "email_address"
    t.string "contact_number"
    t.string "occupation"
    t.string "reference"
    t.text "screening_question"
    t.string "puppy_select"
    t.index ["breeder_id"], name: "index_visitations_on_breeder_id"
    t.index ["user_id"], name: "index_visitations_on_user_id"
  end

  add_foreign_key "breed_breeders", "breeders"
  add_foreign_key "breed_breeders", "breeds"
  add_foreign_key "litters", "breeders"
  add_foreign_key "litters", "parents", column: "mom_id"
  add_foreign_key "litters", "parents", column: "stud_id"
  add_foreign_key "parents", "breeders"
  add_foreign_key "parents", "breeds"
  add_foreign_key "puppies", "breeds"
  add_foreign_key "puppies", "litters"
  add_foreign_key "visitations", "breeders"
  add_foreign_key "visitations", "users"
end
