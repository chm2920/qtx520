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

ActiveRecord::Schema.define(:version => 20120209155939) do

  create_table "admins", :force => true do |t|
    t.string   "adminname"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer "node_id"
    t.string  "name"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fl_categories", :force => true do |t|
    t.string "name"
  end

  create_table "flashpics", :force => true do |t|
    t.string "title"
    t.string "image_file_name"
    t.string "url"
  end

  create_table "fls", :force => true do |t|
    t.integer  "fl_category_id"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindeditor_images", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_categories", :force => true do |t|
    t.string "name"
  end

  create_table "news_topics", :force => true do |t|
    t.integer  "news_category_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", :force => true do |t|
    t.string "name"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.integer  "hits"
    t.integer  "reply_count"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proc_logs", :force => true do |t|
    t.string   "method"
    t.string   "url"
    t.string   "ip"
    t.string   "visit_time"
    t.string   "completed"
    t.string   "views"
    t.string   "activerecord"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "run_logs", :force => true do |t|
    t.string   "log_path"
    t.string   "log_method"
    t.string   "log_params"
    t.string   "log_exception"
    t.string   "log_remote_ip"
    t.datetime "created_at"
  end

  create_table "sign_categories", :force => true do |t|
    t.string "name"
  end

  create_table "signs", :force => true do |t|
    t.integer "sign_category_id"
    t.string  "vs"
  end

  create_table "topic_images", :force => true do |t|
    t.integer  "topic_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "node_id"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "city"
    t.string   "validate_date"
    t.string   "contact"
    t.string   "phone"
    t.string   "qq"
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.integer  "login_times"
    t.integer  "coins"
    t.string   "qq"
    t.string   "phone"
    t.string   "realname"
    t.string   "city"
    t.string   "address"
    t.string   "sign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
