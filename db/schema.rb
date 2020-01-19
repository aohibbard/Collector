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

ActiveRecord::Schema.define(version: 20200118183655) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "birthday"
    t.string "deathday"
    t.string "nationality"
    t.text   "biography"
    t.string "img_url"
    t.string "name_sorted"
  end

  add_index "artists", ["name"], name: "index_artists_on_name"

  create_table "artworks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artist_id"
    t.string  "title"
    t.string  "year"
    t.string  "material"
    t.string  "dimensions"
    t.boolean "owned"
  end

  add_index "artworks", ["material"], name: "index_artworks_on_material"
  add_index "artworks", ["title"], name: "index_artworks_on_title"
  add_index "artworks", ["year"], name: "index_artworks_on_year"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
