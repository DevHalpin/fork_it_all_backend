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

ActiveRecord::Schema.define(version: 2020_10_24_215951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "twists_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twists_id"], name: "index_favorites_on_twists_id"
    t.index ["users_id"], name: "index_favorites_on_users_id"
  end

  create_table "followers", force: :cascade do |t|
    t.string "following_user_id"
    t.string "integer"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_followers_on_users_id"
  end

  create_table "ingredient_measures", force: :cascade do |t|
    t.bigint "ingredients_id"
    t.string "measure"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredients_id"], name: "index_ingredient_measures_on_ingredients_id"
    t.index ["recipes_id"], name: "index_ingredient_measures_on_recipes_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.text "instructions"
    t.string "meal_image"
    t.string "meal_type"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twists", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "user_id"
    t.string "tags"
    t.string "slug"
    t.boolean "is_private"
    t.integer "sort_order"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "profile_picture"
    t.string "handle", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "twists", column: "twists_id"
  add_foreign_key "favorites", "users", column: "users_id"
  add_foreign_key "followers", "users", column: "users_id"
  add_foreign_key "ingredient_measures", "ingredients", column: "ingredients_id"
  add_foreign_key "twists", "recipes"
  add_foreign_key "twists", "users"
end
