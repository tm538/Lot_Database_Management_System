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

ActiveRecord::Schema.define(version: 20130924112857) do

  create_table "batches", force: true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "extra"
    t.string   "restriction"
    t.boolean  "commercial"
  end

  create_table "clients", force: true do |t|
    t.string   "org"
    t.text     "address"
    t.string   "email"
    t.text     "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_name"
  end

  create_table "commonnames", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phylum"
    t.string   "l_class"
    t.string   "genus"
    t.string   "species"
    t.boolean  "hint"
  end

  create_table "genus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "l_classes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lots", force: true do |t|
    t.integer  "client_id"
    t.boolean  "commercial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sampletype_id"
    t.integer  "commonname_id"
    t.string   "samp_id"
    t.string   "region"
    t.string   "site"
    t.string   "genus"
    t.string   "species"
    t.string   "phylum"
    t.string   "l_class"
    t.integer  "data_entered_by"
    t.text     "extra_info"
    t.string   "sample_form"
    t.integer  "analysis_by"
    t.string   "to_return"
    t.boolean  "isotopes"
    t.boolean  "zooms"
    t.boolean  "aar"
    t.boolean  "lipid"
    t.boolean  "dna"
    t.string   "analysis_other"
    t.integer  "user_id"
    t.string   "returned"
    t.datetime "return_date"
    t.string   "archive_box"
    t.integer  "batch_id"
    t.string   "restriction"
    t.string   "town"
    t.string   "Latitude"
    t.string   "Longitude"
    t.string   "county"
    t.string   "district"
    t.string   "parish"
    t.string   "gisdataset"
  end

  add_index "lots", ["id"], name: "index_lots_on_id"

  create_table "phylums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sampletypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.integer  "from"
    t.integer  "to"
    t.integer  "lot"
    t.integer  "client"
    t.boolean  "com"
    t.string   "site"
    t.string   "phylum"
    t.string   "l_class"
    t.string   "genus"
    t.string   "species"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "samp_id"
  end

  add_index "searches", ["id"], name: "index_searches_on_id"

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "role"
    t.boolean  "disabled",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "versions", force: true do |t|
    t.string   "item_type",                null: false
    t.integer  "item_id",                  null: false
    t.string   "event",                    null: false
    t.string   "whodunnit",  default: "1"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
