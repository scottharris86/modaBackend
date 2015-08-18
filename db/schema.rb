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

ActiveRecord::Schema.define(version: 20150818072011) do

  create_table "current_forecasts", force: true do |t|
    t.integer  "time"
    t.string   "summary"
    t.string   "icon"
    t.integer  "precip_intensity"
    t.integer  "precip_probability"
    t.integer  "temperature"
    t.integer  "apparent_temperature"
    t.float    "dew_point"
    t.float    "humidity"
    t.integer  "wind_speed"
    t.integer  "visibility"
    t.float    "cloud_cover"
    t.float    "pressure"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_forecasts", force: true do |t|
    t.integer  "time"
    t.string   "summary"
    t.string   "icon"
    t.integer  "sunrise_time"
    t.integer  "sunset_time"
    t.float    "moon_phase"
    t.integer  "precip_intensity"
    t.integer  "precip_probability"
    t.string   "precip_type"
    t.integer  "temperature_min"
    t.integer  "temperature_max"
    t.float    "dew_point"
    t.float    "humidity"
    t.float    "wind_speed"
    t.integer  "visibility"
    t.float    "cloud_cover"
    t.float    "pressure"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "locatable_id"
    t.string   "locatable_type"
  end

  add_index "locations", ["locatable_id", "locatable_type"], name: "index_locations_on_locatable_id_and_locatable_type"

  create_table "searches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token",   default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
