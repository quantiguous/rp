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

ActiveRecord::Schema.define(version: 20170501065922) do

  create_table "rp_authorized_users", force: :cascade do |t|
    t.integer "available_report_id"
    t.integer "user_id"
  end

  add_index "rp_authorized_users", ["available_report_id", "user_id"], name: "index_rp_authorized_users_on_available_report_id_and_user_id", unique: true

  create_table "rp_available_reports", force: :cascade do |t|
    t.string   "name",                                                    null: false
    t.string   "dsn",                                                     null: false
    t.string   "db_unit",                                                 null: false
    t.string   "msg_model"
    t.string   "mime_type"
    t.string   "file_ext"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "params_cnt"
    t.string   "param1",           limit: 500
    t.string   "param2",           limit: 500
    t.string   "param3",           limit: 500
    t.string   "param4",           limit: 500
    t.string   "param5",           limit: 500
    t.string   "is_public",                    default: "Y"
    t.integer  "batch_size",                   default: 50,               null: false
    t.string   "header_kind",      limit: 1,   default: "C",              null: false
    t.string   "money_format",     limit: 20,  default: "###,###,##0.00", null: false
    t.string   "normalize_space",  limit: 1,   default: "Y"
    t.string   "delimiter",        limit: 1,   default: ","
    t.string   "escape_character", limit: 1,   default: "\""
    t.string   "service_code",     limit: 100, default: "RP"
  end

  create_table "rp_pending_reports", force: :cascade do |t|
    t.string   "broker_uuid",  limit: 500
    t.datetime "created_at"
    t.integer  "report_id"
    t.datetime "run_at"
    t.string   "service_code", limit: 100
  end

  add_index "rp_pending_reports", ["broker_uuid"], name: "index_rp_pending_reports_on_broker_uuid"
  add_index "rp_pending_reports", ["report_id"], name: "index_rp_pending_reports_on_report_id", unique: true

  create_table "rp_reports", force: :cascade do |t|
    t.string   "name",               limit: 100,                             null: false
    t.string   "state",              limit: 50,                              null: false
    t.datetime "queued_at",                                                  null: false
    t.string   "mime_type"
    t.string   "created_by",         limit: 20
    t.string   "report_url"
    t.string   "notify_to"
    t.string   "dsn"
    t.string   "db_unit"
    t.string   "batch_size"
    t.string   "msg_model"
    t.string   "file_ext"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "line_count"
    t.integer  "size_in_bytes"
    t.string   "file_name"
    t.string   "file_path"
    t.string   "fault_code",         limit: 50
    t.string   "fault_subcode",      limit: 50
    t.string   "fault_reason",       limit: 1000
    t.text     "fault_bitstream"
    t.string   "param1"
    t.string   "param2"
    t.string   "param3"
    t.string   "param4"
    t.string   "param5"
    t.string   "file_url"
    t.string   "email_alert_ref_no"
    t.string   "broker_uuid",        limit: 100
    t.string   "header_kind",        limit: 1,    default: "C",              null: false
    t.string   "money_format",       limit: 20,   default: "###,###,##0.00", null: false
    t.string   "normalize_space",    limit: 1,    default: "Y"
    t.string   "delimiter",          limit: 1,    default: ","
    t.string   "escape_character",   limit: 1,    default: "\""
    t.string   "service_code",       limit: 100
  end

  add_index "rp_reports", ["state", "broker_uuid"], name: "index_rp_reports_on_state_and_broker_uuid"

  create_table "rp_settings", force: :cascade do |t|
    t.string  "scheme",                     null: false
    t.string  "host"
    t.string  "username"
    t.string  "password"
    t.string  "virtual_path"
    t.integer "max_age_days",  default: 7,  null: false
    t.integer "max_per_user",  default: 7,  null: false
    t.integer "query_timeout", default: 60
  end

  create_table "rp_users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
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
  end

  add_index "rp_users", ["email"], name: "index_rp_users_on_email", unique: true
  add_index "rp_users", ["reset_password_token"], name: "index_rp_users_on_reset_password_token", unique: true

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
