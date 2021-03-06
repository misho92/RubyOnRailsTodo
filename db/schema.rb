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

ActiveRecord::Schema.define(version: 20140827094215) do

  create_table "members", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "plan"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "portals", force: true do |t|
    t.string  "paymentMethod"
    t.string  "nameOnCard"
    t.string  "cardNumber"
    t.string  "CVC"
    t.string  "validUntil"
    t.string  "accountOwner"
    t.string  "BIC"
    t.string  "IBAN"
    t.string  "bankNo"
    t.string  "plan"
    t.string  "registered"
    t.integer "user_id"
  end

  create_table "todos", force: true do |t|
    t.string  "todo"
    t.string  "done"
    t.integer "user_id"
  end

end
