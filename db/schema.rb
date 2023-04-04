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

ActiveRecord::Schema[7.0].define(version: 2023_04_04_051139) do
  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "fish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_articles_on_fish_id"
  end

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
    t.integer "medium"
    t.string "thumbnail"
  end

  create_table "fish_tank_articles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "fish_tank_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_fish_tank_articles_on_article_id"
    t.index ["fish_tank_id"], name: "index_fish_tank_articles_on_fish_tank_id"
  end

  create_table "fish_tanks", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "fish_tank_image_front"
    t.string "fish_tank_image_sideways"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishes", charset: "utf8mb4", force: :cascade do |t|
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.string "body"
    t.string "post_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_posts_on_article_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "thumbnail_creators", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_thumbnail_creators_on_post_id"
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

  add_foreign_key "articles", "fish"
  add_foreign_key "fish_tank_articles", "articles"
  add_foreign_key "fish_tank_articles", "fish_tanks"
  add_foreign_key "posts", "articles"
  add_foreign_key "posts", "users"
  add_foreign_key "thumbnail_creators", "posts"
end
