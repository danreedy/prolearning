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

ActiveRecord::Schema.define(:version => 20121016201032) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recording_sheets", :force => true do |t|
    t.integer  "observer_id"
    t.integer  "teacher_id"
    t.date     "recorded_on"
    t.integer  "school_year"
    t.string   "semester"
    t.integer  "department_id"
    t.string   "type_of_school"
    t.string   "course"
    t.integer  "number_of_students"
    t.integer  "interval"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "recording_sheets", ["department_id"], :name => "index_recording_sheets_on_department_id"
  add_index "recording_sheets", ["observer_id"], :name => "index_recording_sheets_on_observer_id"
  add_index "recording_sheets", ["teacher_id"], :name => "index_recording_sheets_on_teacher_id"

  create_table "records", :force => true do |t|
    t.integer  "minute"
    t.string   "teacher"
    t.string   "student"
    t.string   "grouping"
    t.string   "topic"
    t.text     "notes"
    t.integer  "recording_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "records", ["recording_sheet_id"], :name => "index_records_on_recording_sheet_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
