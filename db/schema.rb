# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101207162450) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "admins", ["confirmation_token"], :name => "index_admins_on_confirmation_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "contact_forms", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "department_id"
    t.string   "temp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "size"
    t.string   "bathroom_number"
    t.string   "garages_number"
    t.string   "rooms_number"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meter_price"
    t.string   "total_price"
    t.boolean  "sold"
    t.string   "description"
  end

  create_table "pages", :force => true do |t|
    t.string   "title",        :default => "Untitled",    :null => false
    t.text     "content"
    t.string   "slug"
    t.string   "published_at"
    t.string   "status",       :default => "unpublished"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "metatags"
    t.string   "head_title"
  end

  add_index "pages", ["admin_id"], :name => "index_pages_on_admin_id"

  create_table "project_images", :force => true do |t|
    t.integer  "project_id"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "temp_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "state",                                             :default => "0",            :null => false
    t.text     "description"
    t.datetime "published_at"
    t.string   "status",                                            :default => "unpublished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "name",                                              :default => "Proyecto"
    t.string   "code"
    t.decimal  "sales_price",         :precision => 8, :scale => 2, :default => 0.0
    t.string   "property_type",                                     :default => "departamento"
    t.integer  "terrain_area",                                      :default => 0
    t.integer  "constructed_area",                                  :default => 0
    t.integer  "rooms",                                             :default => 0
    t.integer  "bathrooms",                                         :default => 0
    t.integer  "garages",                                           :default => 0
    t.date     "construction_year"
    t.integer  "floors_per_building",                               :default => 0
    t.boolean  "with_furniture",                                    :default => false
    t.string   "lat"
    t.string   "long"
    t.string   "address"
    t.boolean  "sold"
    t.integer  "position"
  end

  create_table "slides", :force => true do |t|
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
