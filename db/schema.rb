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

ActiveRecord::Schema.define(version: 20160817080154) do

  create_table "baselines", force: true do |t|
    t.string   "status"
    t.string   "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "min_freq"
    t.string   "max_freq"
    t.string   "device"
    t.string   "bin_size"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scan_items", force: true do |t|
    t.integer  "spec_scan_id"
    t.integer  "baseline_id"
    t.string   "upper"
    t.string   "lower"
    t.string   "time"
    t.float    "power"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spec_scans", force: true do |t|
    t.string   "status"
    t.string   "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

end
