ActiveRecord::Schema[7.0].define(version: 2022_11_14_164648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "measurement_unit"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "recipe_foods", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
    t.index ["recipe_id"], name: "index_recipe_foods_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.text "description"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  add_foreign_key "foods", "users"
  add_foreign_key "recipe_foods", "foods"
  add_foreign_key "recipe_foods", "recipes"
  add_foreign_key "recipes", "users"
end
