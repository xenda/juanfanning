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

ActiveRecord::Schema.define(:version => 20100827182953) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "",           :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",           :null => false
    t.string   "password_salt",                       :default => "",           :null => false
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
    t.string   "role",                                :default => "supervisor"
    t.string   "name"
  end

  add_index "admins", ["confirmation_token"], :name => "index_admins_on_confirmation_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "downloads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.datetime "enabled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title",        :default => "Untitled",    :null => false
    t.text     "content"
    t.string   "slug"
    t.string   "published_at"
    t.string   "status",       :default => "unpublished"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "project_type",                                         :default => "preliminary", :null => false
    t.string   "state",                                                :default => "0",           :null => false
    t.text     "description"
    t.datetime "published_at"
    t.string   "issuer"
    t.decimal  "bond_amount",           :precision => 12, :scale => 2
    t.string   "sale_type",                                            :default => "competitive"
    t.string   "status",                                               :default => "unpublished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "delivery_date"
    t.string   "document_file_name"
    t.integer  "document_file_size"
    t.string   "document_content_type"
    t.datetime "document_updated_at"
    t.string   "underwriters"
    t.string   "ratings"
    t.string   "preview_file_name"
    t.integer  "preview_file_size"
    t.string   "preview_content_type"
    t.datetime "preview_updated_at"
    t.string   "cusip"
    t.boolean  "delta",                                                :default => true,          :null => false
    t.string   "bond_number"
  end

  create_table "shares", :force => true do |t|
    t.string   "from"
    t.string   "from_email"
    t.string   "to_email"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.text     "content"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",     :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",     :null => false
    t.string   "password_salt",                       :default => "",     :null => false
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
    t.string   "role",                                :default => "user"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "interest",                            :default => "all"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
