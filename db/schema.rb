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

ActiveRecord::Schema.define(version: 20150525071923) do

  create_table "accounts", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "category_type_id", limit: 4
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "categories", ["category_type_id"], name: "index_categories_on_category_type_id", using: :btree

  create_table "category_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "funding_sources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float    "nominal",           limit: 24
    t.date     "tanggal"
    t.text     "keterangan",        limit: 65535
    t.integer  "funding_source_id", limit: 4
    t.integer  "category_id",       limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "transactions", ["category_id"], name: "index_transactions_on_category_id", using: :btree
  add_index "transactions", ["funding_source_id"], name: "index_transactions_on_funding_source_id", using: :btree

  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "funding_sources"
end
