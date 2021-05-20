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

ActiveRecord::Schema.define(version: 2021_05_20_185953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_collections", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "collector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collector_id"], name: "index_art_collections_on_collector_id"
    t.index ["name", "collector_id"], name: "index_art_collections_on_name_and_collector_id", unique: true
  end

  create_table "artwork_shares", force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "viewer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite", default: false
    t.index ["artwork_id", "viewer_id"], name: "index_artwork_shares_on_artwork_id_and_viewer_id", unique: true
    t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
    t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite", default: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
    t.index ["title", "artist_id"], name: "index_artworks_on_title_and_artist_id", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "art_collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id", "art_collection_id"], name: "index_collections_on_artwork_id_and_art_collection_id", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "commenter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body", null: false
    t.index ["artwork_id"], name: "index_comments_on_artwork_id"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
