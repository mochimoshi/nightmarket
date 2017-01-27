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

ActiveRecord::Schema.define(version: 20170127080911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorized_students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "role"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "group_name"
    t.string   "group_primary_name"
    t.string   "group_primary_email"
    t.string   "group_primary_phone"
    t.string   "group_secondary_name"
    t.string   "group_secondary_email"
    t.string   "group_secondary_phone"
    t.string   "group_food_information"
    t.string   "group_booth_size"
    t.string   "group_performance_information"
    t.string   "group_activity_information"
    t.string   "group_description"
    t.string   "group_website"
    t.string   "group_photo"
    t.string   "year_participated"
    t.boolean  "approved"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "vendors", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "vendor_name"
    t.string   "vendor_address"
    t.string   "vendor_primary_name"
    t.string   "vendor_primary_email"
    t.string   "vendor_primary_phone"
    t.string   "vendor_secondary_name"
    t.string   "vendor_secondary_email"
    t.string   "vendor_secondary_phone"
    t.string   "vendor_food_information"
    t.string   "vendor_description"
    t.string   "vendor_website"
    t.string   "vendor_photo"
    t.string   "password"
    t.string   "salt"
    t.string   "year_participated"
    t.boolean  "approved"
  end

end
