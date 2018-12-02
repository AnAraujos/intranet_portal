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

ActiveRecord::Schema.define(version: 2018_12_02_132507) do

  create_table "employee_assets", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate"
  end

  create_table "employee_details", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "phone_number"
    t.string "address_1"
    t.string "address_2"
    t.integer "employee_visa_id"
    t.integer "employee_asset_id"
    t.integer "employee_situation_id"
    t.integer "user_id"
    t.date "dt_entry"
    t.date "dt_leave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.index ["employee_asset_id"], name: "index_employee_details_on_employee_asset_id"
    t.index ["employee_situation_id"], name: "index_employee_details_on_employee_situation_id"
    t.index ["employee_visa_id"], name: "index_employee_details_on_employee_visa_id"
    t.index ["user_id"], name: "index_employee_details_on_user_id"
  end

  create_table "employee_jobs", force: :cascade do |t|
    t.integer "employee_detail_id"
    t.integer "job_id"
    t.integer "employeer_job_situation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_detail_id"], name: "index_employee_jobs_on_employee_detail_id"
    t.index ["employeer_job_situation_id"], name: "index_employee_jobs_on_employeer_job_situation_id"
    t.index ["job_id"], name: "index_employee_jobs_on_job_id"
  end

  create_table "employee_situations", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_visas", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employeer_job_situations", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_situations", force: :cascade do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.date "dt_start"
    t.date "dt_end"
    t.datetime "meeting_time"
    t.time "start_time"
    t.time "end_time"
    t.time "job_end"
    t.integer "supervisor_id"
    t.decimal "travel_hours"
    t.decimal "paid_hours"
    t.integer "supposed_hours"
    t.integer "meeting_point_id"
    t.integer "sub_store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_situation_id"
    t.date "store_end_date"
    t.index ["job_situation_id"], name: "index_jobs_on_job_situation_id"
    t.index ["meeting_point_id"], name: "index_jobs_on_meeting_point_id"
    t.index ["sub_store_id"], name: "index_jobs_on_sub_store_id"
  end

  create_table "meeting_points", force: :cascade do |t|
    t.string "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_stores", force: :cascade do |t|
    t.string "number"
    t.integer "store_id"
    t.decimal "unit_qtd"
    t.string "contact_manager"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_sub_stores_on_store_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "teste@gmail.com", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
