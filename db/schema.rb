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

ActiveRecord::Schema.define(version: 20140219082802) do

  create_table "characters", force: true do |t|
    t.string   "image"
    t.string   "name"
    t.string   "role"
    t.integer  "show_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", force: true do |t|
    t.integer  "number"
    t.string   "name"
    t.text     "overview"
    t.string   "thumbnail"
    t.integer  "season_id"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fashions", force: true do |t|
    t.string   "name"
    t.boolean  "match"
    t.string   "charPic"
    t.string   "productPic"
    t.string   "productLink"
    t.integer  "episode_id"
    t.integer  "show_id"
    t.integer  "season_id"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "name"
    t.string   "banner"
    t.text     "overview"
    t.string   "network"
    t.string   "airsDayOfWeek"
    t.string   "airsTime"
    t.string   "genres"
    t.string   "rating"
    t.integer  "runtime"
    t.string   "status"
    t.string   "fanart"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
