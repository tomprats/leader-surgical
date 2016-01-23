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

ActiveRecord::Schema.define(version: 20151027063215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.boolean  "active",       default: false, null: false
    t.integer  "specialty_id",                 null: false
    t.string   "image",                        null: false
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.string   "kind"
    t.string   "description"
    t.string   "bio"
    t.string   "accolades"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "doctors", ["active"], name: "index_doctors_on_active", using: :btree
  add_index "doctors", ["last_name", "first_name"], name: "index_doctors_on_last_name_and_first_name", using: :btree
  add_index "doctors", ["specialty_id"], name: "index_doctors_on_specialty_id", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.boolean  "active",     default: false, null: false
    t.integer  "rank",       default: 10000, null: false
    t.string   "question",                   null: false
    t.string   "answer",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "faqs", ["active"], name: "index_faqs_on_active", using: :btree
  add_index "faqs", ["rank"], name: "index_faqs_on_rank", using: :btree

  create_table "procedures", force: :cascade do |t|
    t.boolean  "active",       default: false, null: false
    t.integer  "specialty_id",                 null: false
    t.string   "name",                         null: false
    t.string   "link"
    t.string   "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "procedures", ["active"], name: "index_procedures_on_active", using: :btree
  add_index "procedures", ["name"], name: "index_procedures_on_name", using: :btree
  add_index "procedures", ["specialty_id"], name: "index_procedures_on_specialty_id", using: :btree

  create_table "specialties", force: :cascade do |t|
    t.boolean  "active",      default: false, null: false
    t.integer  "parent_id"
    t.integer  "doctor_id"
    t.string   "name",                        null: false
    t.string   "link"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "specialties", ["active"], name: "index_specialties_on_active", using: :btree
  add_index "specialties", ["doctor_id"], name: "index_specialties_on_doctor_id", using: :btree
  add_index "specialties", ["name"], name: "index_specialties_on_name", using: :btree
  add_index "specialties", ["parent_id"], name: "index_specialties_on_parent_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",           default: false, null: false
    t.string   "email",                           null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["admin"], name: "index_users_on_admin", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["last_name", "first_name"], name: "index_users_on_last_name_and_first_name", using: :btree

  create_table "visits", force: :cascade do |t|
    t.boolean  "active",      default: false, null: false
    t.integer  "rank",        default: 10000, null: false
    t.integer  "parent_id"
    t.string   "name",                        null: false
    t.string   "file"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "visits", ["active"], name: "index_visits_on_active", using: :btree
  add_index "visits", ["rank"], name: "index_visits_on_rank", using: :btree

end
