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

ActiveRecord::Schema.define(:version => 20110729014506) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.text     "category_description"
    t.integer  "restaurant_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorysales", :force => true do |t|
    t.float    "cs_amount"
    t.integer  "category_id"
    t.integer  "employee_id"
    t.float    "vat"
    t.float    "void"
    t.float    "servicecharge"
    t.float    "cs_revenue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

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

  create_table "subcategories", :force => true do |t|
    t.string   "subcategory_name"
    t.text     "subcategory_description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
