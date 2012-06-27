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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120627082519) do

  create_table "block_contents", :force => true do |t|
    t.integer  "position"
    t.string   "comment"
    t.string   "collection_block_id"
    t.integer  "recipe_id"
    t.integer  "preferred_servings"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "collection_blocks", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.integer  "recipe_collection_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "custom_products", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.integer  "recipe_id"
    t.decimal  "amount",     :precision => 9, :scale => 4
    t.integer  "unit_id"
    t.integer  "product_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "instructions", :force => true do |t|
    t.integer  "step"
    t.string   "text"
    t.integer  "recipe_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipe_collections", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "servings",   :null => false
    t.string   "cook_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shopping_lists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sl_custom_rows", :force => true do |t|
    t.integer  "shopping_list_id"
    t.integer  "custom_product_id"
    t.boolean  "in_basket"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sl_product_rows", :force => true do |t|
    t.integer  "shopping_list_id"
    t.integer  "product_id"
    t.integer  "unit_id"
    t.decimal  "amount",           :precision => 9, :scale => 4
    t.integer  "recipe_id"
    t.boolean  "in_basket"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "password_salt"
  end

end
