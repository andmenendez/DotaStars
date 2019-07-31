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

ActiveRecord::Schema.define(version: 2019_07_26_131758) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "date_start"
    t.integer "radiant_id"
    t.integer "dire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dire_id"], name: "index_matches_on_dire_id"
    t.index ["event_id"], name: "index_matches_on_event_id"
    t.index ["radiant_id"], name: "index_matches_on_radiant_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

end
