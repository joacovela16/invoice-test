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

ActiveRecord::Schema.define(version: 2020_12_16_001233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_headers", force: :cascade do |t|
    t.string "client_name", null: false
    t.string "client_last_name", null: false
    t.string "doc_id", null: false
    t.date "creation_date"
    t.date "modification_date"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.float "rate"
    t.float "total", default: 0.0
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.date "creation_date"
    t.date "modification_date"
    t.string "product_name", null: false
    t.float "quantity", default: 0.0
    t.float "price", default: 0.0, null: false
    t.float "total", default: 0.0
    t.text "description", default: ""
    t.bigint "invoice_header_id"
    t.index ["invoice_header_id"], name: "index_invoice_lines_on_invoice_header_id"
  end

  add_foreign_key "invoice_lines", "invoice_headers"
end
