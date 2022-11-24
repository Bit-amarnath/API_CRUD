

ActiveRecord::Schema[7.0].define(version: 2022_11_22_090243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "fact"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_facts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "facts", "users"
end
