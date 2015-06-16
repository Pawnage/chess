# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150616135928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "player_white"
    t.integer  "player_black"
    t.integer  "player_turn"
    t.integer  "winner"
    t.integer  "moves"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer  "game_id"
    t.integer  "row_position"
    t.integer  "col_position"
    t.string   "color"
    t.string   "piece_type"
    t.boolean  "alive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
