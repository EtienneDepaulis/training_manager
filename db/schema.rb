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

ActiveRecord::Schema.define(version: 20140813165818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_trgm"

  create_table "allowances", force: true do |t|
    t.integer  "group_id"
    t.integer  "training_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allowances", ["group_id"], name: "index_allowances_on_group_id", using: :btree
  add_index "allowances", ["training_session_id"], name: "index_allowances_on_training_session_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["parent_id"], name: "index_groups_on_parent_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "user_id"
    t.integer  "training_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_answered",         default: false
    t.boolean  "is_confirmed",        default: false
  end

  add_index "invitations", ["training_session_id"], name: "index_invitations_on_training_session_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_sessions", force: true do |t|
    t.text     "description"
    t.datetime "started_at"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "training_sessions", ["location_id"], name: "index_training_sessions_on_location_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "token"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree

end
