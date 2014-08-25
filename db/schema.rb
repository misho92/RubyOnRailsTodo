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

ActiveRecord::Schema.define(version: 20140825104241) do

  create_table "accounts", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portals", force: true do |t|
    t.string  "payment"
    t.string  "name_on_card"
    t.string  "card_number"
    t.string  "CVC"
    t.string  "valid_until"
    t.string  "owner_of_account"
    t.string  "BIC"
    t.string  "IBAN"
    t.string  "bank_account_number"
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
