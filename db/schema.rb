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

ActiveRecord::Schema.define(version: 20160825135046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "shopify_product_id"
    t.string   "title"
    t.text     "body_html"
    t.string   "vendor"
    t.string   "product_type"
    t.string   "handle"
    t.string   "template_suffix"
    t.string   "published_scope"
    t.string   "tags"
    t.text     "options"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "products", ["shop_id"], name: "index_products_on_shop_id", using: :btree
  add_index "products", ["shopify_product_id"], name: "index_products_on_shopify_product_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "shop_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setup_requests", force: :cascade do |t|
    t.string   "name"
    t.integer  "shop_id"
    t.string   "source_type"
    t.string   "file_format"
    t.string   "state",       default: "pending", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "description"
    t.string   "subject"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain",      null: false
    t.string   "shopify_token",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "shop_id"
    t.integer  "product_id"
    t.string   "shopify_variant_id"
    t.string   "title"
    t.decimal  "price",                  precision: 8, scale: 2
    t.string   "sku"
    t.integer  "position"
    t.integer  "grams"
    t.string   "inventory_policy"
    t.decimal  "compare_at_price",       precision: 8, scale: 2
    t.string   "fulfillment_service"
    t.string   "inventory_management"
    t.string   "option1"
    t.string   "option2"
    t.string   "option3"
    t.boolean  "taxable"
    t.string   "barcode"
    t.integer  "inventory_quantity"
    t.decimal  "weight",                 precision: 8, scale: 2
    t.string   "weight_unit"
    t.integer  "old_inventory_quantity"
    t.boolean  "requires_shipping"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id", using: :btree
  add_index "stocks", ["shop_id"], name: "index_stocks_on_shop_id", using: :btree
  add_index "stocks", ["shopify_variant_id"], name: "index_stocks_on_shopify_variant_id", using: :btree

end
