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

ActiveRecord::Schema.define(version: 2020_05_04_144758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "name"
    t.bigint "departement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_adresses_on_departement_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "status", default: 0
    t.bigint "topic_id"
    t.bigint "user_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
    t.index ["topic_id"], name: "index_blogs_on_topic_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departements", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_departements_on_region_id"
  end

  create_table "exercices", force: :cascade do |t|
    t.text "introduction"
    t.text "developpement"
    t.text "conclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lecons", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.text "main_image"
    t.text "thumb_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.integer "percent_utilized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "badge"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_technologies_on_portfolio_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adresses", "departements"
  add_foreign_key "blogs", "topics"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "departements", "regions"
  add_foreign_key "regions", "countries"
  add_foreign_key "technologies", "portfolios"
end
