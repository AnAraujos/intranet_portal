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

ActiveRecord::Schema.define(version: 2018_11_18_145558) do

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
