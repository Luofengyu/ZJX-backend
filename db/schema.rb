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

ActiveRecord::Schema.define(version: 20170517155327) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address"
    t.decimal  "lat",              precision: 10, scale: 6
    t.decimal  "lng",              precision: 10, scale: 6
    t.string   "comment"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  end

  create_table "cal_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "base",        limit: 24
    t.float    "extra",       limit: 24
    t.integer  "person_type",                         comment: "0:取送 1:工厂"
    t.string   "desc"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "is_del",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_cities_on_category_id", using: :btree
    t.index ["city_id"], name: "index_categories_cities_on_city_id", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id", using: :btree
  end

  create_table "cities_promotion_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "city_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["city_id"], name: "index_cities_promotion_rules_on_city_id", using: :btree
    t.index ["promotion_rule_id"], name: "index_cities_promotion_rules_on_promotion_rule_id", using: :btree
  end

  create_table "cities_workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "worker_id"
    t.index ["city_id"], name: "index_cities_workers_on_city_id", using: :btree
    t.index ["worker_id"], name: "index_cities_workers_on_worker_id", using: :btree
  end

  create_table "coupon_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "validity_type"
    t.date     "valid_from"
    t.date     "valid_to"
    t.integer  "fixed_begin_term"
    t.integer  "fixed_term"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "coupon_list_id"
    t.integer  "user_id"
    t.date     "vaild_from"
    t.date     "valid_to"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coupon_list_id"], name: "index_coupons_on_coupon_list_id", using: :btree
    t.index ["user_id"], name: "index_coupons_on_user_id", using: :btree
  end

  create_table "courier_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                 collation: "utf8_general_ci"
    t.string   "tel",                                  collation: "utf8_general_ci"
    t.string   "sex",                                  collation: "utf8_general_ci"
    t.string   "city",                                 collation: "utf8_general_ci"
    t.string   "region",                               collation: "utf8_general_ci"
    t.string   "community",                            collation: "utf8_general_ci"
    t.string   "house_number",                         collation: "utf8_general_ci"
    t.integer  "courier_id"
    t.float    "lat",          limit: 24
    t.float    "lng",          limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "courier_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "money",      limit: 24
    t.integer  "courier_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "courier_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.float    "money",      limit: 24
    t.integer  "courier_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "couriers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mobile",                                 null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "locked_at"
    t.string   "name"
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["mobile"], name: "index_couriers_on_mobile", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_couriers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "couriers_stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "courier_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mobile",                                 null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "tel"
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["mobile"], name: "index_factories_on_mobile", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_factories_on_reset_password_token", unique: true, using: :btree
  end

  create_table "factories_stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "factory_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factory_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                 collation: "utf8_general_ci"
    t.string   "tel",                                  collation: "utf8_general_ci"
    t.string   "sex",                                  collation: "utf8_general_ci"
    t.string   "city",                                 collation: "utf8_general_ci"
    t.string   "region",                               collation: "utf8_general_ci"
    t.string   "community",                            collation: "utf8_general_ci"
    t.string   "house_number",                         collation: "utf8_general_ci"
    t.integer  "factory_id"
    t.float    "lat",          limit: 24
    t.float    "lng",          limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "factory_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "money",      limit: 24
    t.integer  "factory_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "factory_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.float    "money",      limit: 24
    t.integer  "factory_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "factory_process_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "factory_id"
    t.integer  "category_id"
    t.integer  "product_id"
    t.date     "process_on"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_factory_process_records_on_category_id", using: :btree
    t.index ["factory_id"], name: "index_factory_process_records_on_factory_id", using: :btree
    t.index ["product_id"], name: "index_factory_process_records_on_product_id", using: :btree
  end

  create_table "factory_settlement_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "factory_id"
    t.integer  "category_id"
    t.integer  "product_id"
    t.date     "settlement_on"
    t.integer  "amount"
    t.float    "price",         limit: 24
    t.float    "money",         limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["category_id"], name: "index_factory_settlement_records_on_category_id", using: :btree
    t.index ["factory_id"], name: "index_factory_settlement_records_on_factory_id", using: :btree
    t.index ["product_id"], name: "index_factory_settlement_records_on_product_id", using: :btree
  end

  create_table "factory_settlement_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "from_date"
    t.integer  "priority"
    t.integer  "factory_id"
    t.integer  "settlement_rule_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["factory_id"], name: "index_factory_settlement_rules_on_factory_id", using: :btree
    t.index ["settlement_rule_id"], name: "index_factory_settlement_rules_on_settlement_rule_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amount"
    t.float    "price",      limit: 24
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["order_id"], name: "index_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_items_on_product_id", using: :btree
  end

  create_table "order_promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.float    "discount",       limit: 24
    t.float    "premise",        limit: 24
    t.integer  "coupon_list_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["coupon_list_id"], name: "index_order_promotions_on_coupon_list_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "address_id"
    t.float    "total_price",     limit: 24
    t.integer  "status",                     default: 0
    t.integer  "courier_status",             default: 0
    t.integer  "voucher_status",             default: 0
    t.integer  "cleaning_status",            default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "waybill_id"
    t.integer  "factory_id"
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["category_id"], name: "index_orders_on_category_id", using: :btree
    t.index ["factory_id"], name: "index_orders_on_factory_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    t.index ["waybill_id"], name: "index_orders_on_waybill_id", using: :btree
  end

  create_table "orders_status", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "status_desc", collation: "utf8_general_ci"
  end

  create_table "price_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "grade"
    t.integer  "city_id"
    t.integer  "category_id"
    t.date     "from_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_price_rules_on_category_id", using: :btree
    t.index ["city_id"], name: "index_price_rules_on_city_id", using: :btree
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "price1",     limit: 24, default: 0.0
    t.float    "price2",     limit: 24, default: 0.0
    t.float    "price3",     limit: 24, default: 0.0
    t.float    "price4",     limit: 24, default: 0.0
    t.float    "price5",     limit: 24, default: 0.0
    t.float    "price6",     limit: 24, default: 0.0
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["product_id"], name: "index_prices_on_product_id", using: :btree
  end

  create_table "product_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "serial"
    t.integer  "status",     default: 0
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["order_id"], name: "index_product_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_product_items_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "is_del",      default: false
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "promotion_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "coupon_list_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coupon_list_id"], name: "index_promotion_rules_on_coupon_list_id", using: :btree
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_regions_on_parent_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.string   "comment"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "settlement_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "settlement_rule_id"
    t.integer  "product_id"
    t.float    "price",              limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["product_id"], name: "index_settlement_prices_on_product_id", using: :btree
    t.index ["settlement_rule_id"], name: "index_settlement_prices_on_settlement_rule_id", using: :btree
  end

  create_table "settlement_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "city_id"
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_settlement_rules_on_category_id", using: :btree
    t.index ["city_id"], name: "index_settlement_rules_on_city_id", using: :btree
  end

  create_table "station_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                 collation: "utf8_general_ci"
    t.string   "tel",                                  collation: "utf8_general_ci"
    t.string   "sex",                                  collation: "utf8_general_ci"
    t.string   "city",                                 collation: "utf8_general_ci"
    t.string   "region",                               collation: "utf8_general_ci"
    t.string   "community",                            collation: "utf8_general_ci"
    t.string   "house_number",                         collation: "utf8_general_ci"
    t.integer  "station_id"
    t.float    "lat",          limit: 24
    t.float    "lng",          limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "region_id"
    t.index ["region_id"], name: "index_stations_on_region_id", using: :btree
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                 collation: "utf8_general_ci"
    t.string   "tel",                                  collation: "utf8_general_ci"
    t.string   "sex",                                  collation: "utf8_general_ci"
    t.string   "city",                                 collation: "utf8_general_ci"
    t.string   "region",                               collation: "utf8_general_ci"
    t.string   "community",                            collation: "utf8_general_ci"
    t.string   "house_number",                         collation: "utf8_general_ci"
    t.integer  "user_id"
    t.float    "lat",          limit: 24
    t.float    "lng",          limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_card_charge_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "min",        limit: 24
    t.float    "money_give", limit: 24
    t.integer  "city_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["city_id"], name: "index_user_card_charge_settings_on_city_id", using: :btree
  end

  create_table "user_card_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.float    "real_money",    limit: 24
    t.float    "fake_money",    limit: 24
    t.integer  "user_id"
    t.string   "loggable_type"
    t.integer  "loggable_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "real_money", limit: 24
    t.float    "fake_money", limit: 24
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mobile",                              null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "waybills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status",        default: 0
    t.string   "sender_type"
    t.integer  "sender_id"
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "waybill_id"
    t.datetime "exp_time"
    t.datetime "actual_time"
    t.integer  "order_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["order_id"], name: "index_waybills_on_order_id", using: :btree
    t.index ["receiver_type", "receiver_id"], name: "index_waybills_on_receiver_type_and_receiver_id", using: :btree
    t.index ["sender_type", "sender_id"], name: "index_waybills_on_sender_type_and_sender_id", using: :btree
    t.index ["waybill_id"], name: "index_waybills_on_waybill_id", using: :btree
  end

  create_table "waybills_status", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "status_desc", collation: "utf8_general_ci"
  end

  create_table "worker_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "money",      limit: 24
    t.integer  "worker_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "worker_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind"
    t.float    "money",      limit: 24
    t.integer  "worker_id"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "worker_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "worker_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_worker_roles_on_role_id", using: :btree
    t.index ["worker_id"], name: "index_worker_roles_on_worker_id", using: :btree
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "cities_promotion_rules", "cities"
  add_foreign_key "cities_promotion_rules", "promotion_rules"
  add_foreign_key "coupons", "coupon_lists"
  add_foreign_key "coupons", "users"
  add_foreign_key "factory_process_records", "categories"
  add_foreign_key "factory_process_records", "factories"
  add_foreign_key "factory_process_records", "products"
  add_foreign_key "factory_settlement_records", "categories"
  add_foreign_key "factory_settlement_records", "factories"
  add_foreign_key "factory_settlement_records", "products"
  add_foreign_key "factory_settlement_rules", "factories"
  add_foreign_key "factory_settlement_rules", "settlement_rules"
  add_foreign_key "order_promotions", "coupon_lists"
  add_foreign_key "prices", "products"
  add_foreign_key "product_items", "orders"
  add_foreign_key "product_items", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "promotion_rules", "coupon_lists"
  add_foreign_key "settlement_prices", "products"
  add_foreign_key "settlement_prices", "settlement_rules"
  add_foreign_key "settlement_rules", "categories"
  add_foreign_key "settlement_rules", "cities"
  add_foreign_key "user_card_charge_settings", "cities"
  add_foreign_key "worker_roles", "roles"
  add_foreign_key "worker_roles", "workers"
end
