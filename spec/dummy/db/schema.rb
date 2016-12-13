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

ActiveRecord::Schema.define(version: 20161212150154) do

  create_table "rp_available_reports", force: :cascade do |t|
    t.string   "code",         null: false
    t.string   "dsn"
    t.string   "db_unit_name"
    t.string   "msg_model"
    t.string   "mime_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rp_pending_reports", force: :cascade do |t|
    t.string   "broker_uuid",   limit: 500
    t.datetime "created_at"
    t.integer  "rp_reports_id"
  end

  create_table "rp_reports", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "state",                   null: false
    t.datetime "queued_at",               null: false
    t.string   "mime_type"
    t.string   "created_by",              null: false
    t.string   "report_url"
    t.string   "notify_to"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "line_count"
    t.integer  "size_in_bytes"
    t.string   "file_name"
    t.string   "file_path"
    t.string   "fault_code"
    t.string   "fault_subcode"
    t.string   "fault_reason"
    t.text     "fault_bitstream"
    t.integer  "rp_available_reports_id"
  end

end
