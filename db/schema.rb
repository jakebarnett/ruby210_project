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

ActiveRecord::Schema.define(version: 20160309070344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.integer  "projects_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attribs", ["projects_id"], name: "index_attribs_on_projects_id", using: :btree

  create_table "capabilities", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.boolean "passing"
    t.integer "attrib_id"
    t.integer "component_id"
  end

  add_index "capabilities", ["attrib_id", "component_id"], name: "index_capabilities_on_attrib_id_and_component_id", using: :btree

  create_table "components", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "projects_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["projects_id"], name: "index_components_on_projects_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "attribs", "projects"
  add_foreign_key "components", "projects"
end
