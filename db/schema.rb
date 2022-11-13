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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_141255) do
  create_table "fish", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "scientific_name"
    t.text "body"
    t.integer "body_length"
    t.integer "minimum"
    t.integer "maximum"
    t.string "temperature"
    t.string "water_quality"
    t.string "fish_image_xs"
    t.string "fish_image_s"
    t.string "fish_image_m"
    t.string "fish_image_l"
    t.string "fish_image_xl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fish_tanks", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "fish_tank_image_front"
    t.string "fish_tank_image_sideways"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
