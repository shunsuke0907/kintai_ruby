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

ActiveRecord::Schema.define(version: 20190327155948) do

  create_table "attendance_edit_requests", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "before_change_started_at"
    t.datetime "before_change_finished_at"
    t.datetime "after_change_started_at"
    t.datetime "after_change_finished_at"
    t.date "approval_date"
    t.integer "approver"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_leaving_next_day", default: false
    t.integer "approval_status", default: 0
    t.index ["user_id"], name: "index_attendance_edit_requests_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_estimated_time"
    t.string "business_outline"
    t.boolean "is_leaving_next_day", default: false
    t.integer "approval_status", default: 0
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bases", force: :cascade do |t|
    t.string "base_number"
    t.string "base_name"
    t.string "attendance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2019-02-19 22:30:00"
    t.datetime "work_time", default: "2019-02-19 23:00:00"
    t.integer "base_id"
    t.integer "position", default: 0
    t.string "employee_number"
    t.string "card_number"
    t.datetime "designated_working_start_time"
    t.datetime "designated_working_end_time"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
