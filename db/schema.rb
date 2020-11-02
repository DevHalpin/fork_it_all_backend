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

ActiveRecord::Schema.define(version: 2020_11_02_013125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "twist_id"
    t.bigint "user_id"
    t.index ["twist_id"], name: "index_favorites_on_twist_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
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
    t.string "ingredient1"
    t.string "ingredient2"
    t.string "ingredient3"
    t.string "ingredient4"
    t.string "ingredient5"
    t.string "ingredient6"
    t.string "ingredient7"
    t.string "ingredient8"
    t.string "ingredient9"
    t.string "ingredient10"
    t.string "ingredient11"
    t.string "ingredient12"
    t.string "ingredient13"
    t.string "ingredient14"
    t.string "ingredient15"
    t.string "ingredient16"
    t.string "ingredient17"
    t.string "ingredient18"
    t.string "ingredient19"
    t.string "ingredient20"
    t.string "measure1"
    t.string "measure2"
    t.string "measure3"
    t.string "measure4"
    t.string "measure5"
    t.string "measure6"
    t.string "measure7"
    t.string "measure8"
    t.string "measure9"
    t.string "measure10"
    t.string "measure11"
    t.string "measure12"
    t.string "measure13"
    t.string "measure14"
    t.string "measure15"
    t.string "measure16"
    t.string "measure17"
    t.string "measure18"
    t.string "measure19"
    t.string "measure20"
  end

  create_table "twists", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "user_id"
    t.string "tags"
    t.string "slug"
    t.boolean "is_private"
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
    t.string "name"
    t.text "bio"
    t.string "password_digest"
  end

  add_foreign_key "followers", "users", column: "users_id"
  add_foreign_key "ingredient_measures", "ingredients", column: "ingredients_id"
  add_foreign_key "twists", "recipes"
  add_foreign_key "twists", "users"
end
