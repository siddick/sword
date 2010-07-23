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

ActiveRecord::Schema.define(:version => 20100723120625) do

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "context"
    t.string   "description"
    t.string   "controller"
    t.string   "menu_view"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["context"], :name => "index_components_on_context"

  create_table "content_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "type"
    t.text     "data"
    t.string   "version"
    t.integer  "latest_content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gadget_position_maps", :force => true do |t|
    t.integer  "gadget_id"
    t.integer  "position_id"
    t.text     "options"
    t.integer  "sort_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gadgets", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "view"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "parent_menu_id"
    t.string   "url"
    t.text     "options"
    t.integer  "operation_id"
    t.integer  "sort_value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_role_maps", :force => true do |t|
    t.integer  "operation_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", :force => true do |t|
    t.integer  "component_id"
    t.string   "action"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_role_maps", :force => true do |t|
    t.integer  "page_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "header"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_role_maps", :force => true do |t|
    t.integer  "position_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.integer  "parent_position_id"
    t.string   "description"
    t.text     "options"
    t.boolean  "frozen_position"
    t.integer  "sort_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "frozen_role", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_component_maps", :force => true do |t|
    t.integer  "site_id"
    t.integer  "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_gadget_position_maps", :force => true do |t|
    t.integer  "site_id"
    t.integer  "gadget_position_map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_page_maps", :force => true do |t|
    t.integer  "site_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_role_maps", :force => true do |t|
    t.integer  "site_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "description"
    t.integer  "theme_id"
    t.text     "theme_options"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theme_position_maps", :force => true do |t|
    t.integer  "theme_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_role_maps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "md5_password"
    t.string   "fullname"
    t.boolean  "enable"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
