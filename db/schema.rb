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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130113211752) do

  create_table "cards", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "cardset_id"
    t.string   "image_url"
    t.string   "hint_text"
    t.string   "answer_text"
  end

  create_table "cardsets", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "games", :force => true do |t|
    t.integer  "interval"
    t.integer  "number_of_rounds"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "section_id"
    t.integer  "cardset_id"
  end

  create_table "matchups", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "round_id"
    t.integer  "card_id"
    t.integer  "student1_id"
    t.integer  "student2_id"
  end

  create_table "participations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "student_id"
    t.string   "shortcode"
    t.datetime "connected_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rounds", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "game_id"
    t.integer  "round_number"
  end

  create_table "scores", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "matchup_id"
    t.integer  "student_id"
    t.integer  "points"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "state_id",   :limit => 256
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state_id",   :limit => 256
    t.integer  "section_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
