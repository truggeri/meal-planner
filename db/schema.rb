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

ActiveRecord::Schema.define(version: 2019_09_29_210920) do

  create_table "accounts", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "name", null: false
    t.integer "users_count", default: 0, null: false
    t.bigint "primary_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description", limit: 200, null: false
    t.boolean "fresh", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.integer "amount", null: false
    t.integer "measure", null: false
    t.boolean "precise_amount", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "ingredient_id"], name: "index_recipe_ingredients_on_recipe_id_and_ingredient_id", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description", limit: 500, null: false
    t.integer "minutes_to_make"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display"
    t.bigint "account_id"
    t.index ["display"], name: "index_recipes_on_display"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
