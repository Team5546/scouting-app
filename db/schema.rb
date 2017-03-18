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

ActiveRecord::Schema.define(version: 20170318041636) do

  create_table "alliance_members", force: :cascade do |t|
    t.integer "team_id"
    t.integer "alliance_id"
    t.index ["alliance_id"], name: "index_alliance_members_on_alliance_id"
    t.index ["team_id"], name: "index_alliance_members_on_team_id"
  end

  create_table "alliances", force: :cascade do |t|
    t.integer "match_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "team3_id"
    t.string  "color"
    t.integer "score"
    t.integer "total_rotors"
    t.integer "ranking_points"
    t.index ["match_id"], name: "index_alliances_on_match_id"
    t.index ["team1_id"], name: "index_alliances_on_team1_id"
    t.index ["team2_id"], name: "index_alliances_on_team2_id"
    t.index ["team3_id"], name: "index_alliances_on_team3_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "number"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "team_id"
    t.integer "match_id"
    t.integer "scout_id"
    t.boolean "auto_moved"
    t.integer "auto_fuel_speed"
    t.integer "auto_fuel_accuracy"
    t.boolean "auto_fuel_bottom"
    t.integer "auto_gears_collected"
    t.integer "auto_gears_delivered"
    t.boolean "auto_rotors"
    t.boolean "auto_goal_line"
    t.boolean "auto_flipped"
    t.integer "teleop_fuel_speed"
    t.integer "teleop_fuel_accuracy"
    t.decimal "teleop_fuel_bottom",          precision: 3, scale: 2
    t.integer "teleop_gears_collected"
    t.integer "teleop_gears_delivered"
    t.boolean "teleop_gears_off_the_ground"
    t.boolean "climb"
    t.boolean "flipped"
    t.boolean "broken"
    t.text    "comments"
    t.index ["match_id"], name: "index_reports_on_match_id"
    t.index ["scout_id"], name: "index_reports_on_scout_id"
    t.index ["team_id"], name: "index_reports_on_team_id"
  end

  create_table "scouts", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.boolean "is_admin"
    t.integer "slot"
    t.string  "nickname"
    t.boolean "is_active",       default: true
    t.string  "password_digest"
  end

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "number"
    t.boolean "high_fuel"
    t.boolean "low_fuel"
    t.boolean "get_gear"
    t.boolean "deliver_gear"
    t.boolean "climb_rope"
    t.text    "comments"
    t.string  "top_picture"
    t.string  "side_picture"
    t.string  "front_picture"
  end

  create_table "weights", force: :cascade do |t|
    t.string  "name"
    t.integer "weight"
  end

end
