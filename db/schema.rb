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

ActiveRecord::Schema.define(version: 2019_09_27_191929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "outings", force: :cascade do |t|
    t.bigint "relationship_id"
    t.string "location"
    t.string "activity"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_outings_on_relationship_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "anniversary"
    t.datetime "start_date"
    t.datetime "first_date"
    t.string "nickname"
    t.integer "asker_id"
    t.integer "askee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "outings", "relationships"
end
