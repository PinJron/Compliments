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

ActiveRecord::Schema[7.0].define(version: 2023_09_06_153925) do
  create_table "compliments", force: :cascade do |t|
    t.integer "user_id"
    t.string "compliment_text"
    t.boolean "is_used"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at"
    t.index ["user_id"], name: "index_compliments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role_id"
    t.integer "last_compliment_id"
    t.string "password_digest"
    t.datetime "created_at"
  end

  add_foreign_key "compliments", "users"
end
