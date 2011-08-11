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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110807141953) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.text     "category_description"
    t.integer  "restaurant_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorysales", :id => false, :force => true do |t|
    t.integer  "id",                               :null => false
    t.float    "cs_amount"
    t.integer  "category_id",       :default => 0, :null => false
    t.integer  "employee_id"
    t.float    "vat"
    t.float    "void"
    t.float    "servicecharge"
    t.float    "cs_revenue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
    t.integer  "customer_count"
    t.integer  "transaction_count"
  end

  add_index "categorysales", ["category_id"], :name => "FK_categorysales_1"
  add_index "categorysales", ["employee_id"], :name => "FK_categorysales_employees"

  create_table "employees", :force => true do |t|
    t.string   "employee_firstName"
    t.string   "employee_lastName"
    t.integer  "branch_id"
    t.date     "employee_dateEmployed"
    t.integer  "job_id"
    t.integer  "department_id"
    t.date     "employee_birthday"
    t.integer  "employee_age"
    t.string   "employee_contactNumber"
    t.string   "employee_sss"
    t.string   "employee_tin"
    t.text     "employee_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "end_counts", :force => true do |t|
    t.date     "endcount_date"
    t.float    "endcount_quantity"
    t.integer  "inventory_id"
    t.date     "beginning_date"
    t.float    "beginning_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_items", :force => true do |t|
    t.string   "inventory_item"
    t.float    "inventory_unitCost"
    t.integer  "branch_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_items", :force => true do |t|
    t.float    "purchase_unitCost"
    t.float    "vat_amount"
    t.float    "net_amount"
    t.float    "purchase_quantity"
    t.string   "purchase_remarks"
    t.string   "purchase_item"
    t.integer  "invoice_id"
    t.integer  "inventory_id"
    t.string   "vat_type"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchase_date"
    t.integer  "supplier_id"
    t.integer  "branch_id",         :limit => 8
    t.float    "purchase_amount"
  end

  create_table "restaurants", :force => true do |t|
    t.integer  "store_id"
    t.string   "restaurant_name"
    t.integer  "company_id"
    t.text     "restaurant_description"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settlement_sales", :force => true do |t|
    t.float    "ss_amount"
    t.integer  "st_id"
    t.integer  "stemployee_id"
    t.float    "vat"
    t.float    "void"
    t.date     "ss_date"
    t.float    "ss_revenue"
    t.integer  "customerCount"
    t.integer  "transactionCount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settlement_types", :force => true do |t|
    t.string   "st_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settlementsales", :force => true do |t|
    t.float    "ss_amount"
    t.integer  "st_id"
    t.integer  "employee_id"
    t.float    "vat"
    t.float    "void"
    t.date     "ss_date"
    t.float    "ss_revenue"
    t.integer  "customerCount"
    t.integer  "transactionCount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", :force => true do |t|
    t.string   "subcategory_name"
    t.text     "subcategory_description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units_lists", :force => true do |t|
    t.string   "unit_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
