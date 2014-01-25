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

ActiveRecord::Schema.define(version: 20140125213051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "categories_tours", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "tour_id",     null: false
  end

  add_index "categories_tours", ["category_id", "tour_id"], name: "index_categories_tours_on_category_id_and_tour_id", unique: true, using: :btree

  create_table "tours", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "city_id",     null: false
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tours", ["name"], name: "index_tours_on_name", unique: true, using: :btree

end
