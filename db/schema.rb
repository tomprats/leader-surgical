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

ActiveRecord::Schema.define(version: 20160214101228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_parts", force: :cascade do |t|
    t.boolean  "active",      default: false, null: false
    t.integer  "doctor_id",                   null: false
    t.string   "name",                        null: false
    t.string   "color",                       null: false
    t.string   "coords",                      null: false
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["active"], name: "index_body_parts_on_active", using: :btree
  end

  create_table "doctors", force: :cascade do |t|
    t.boolean  "active",       default: false, null: false
    t.integer  "specialty_id",                 null: false
    t.string   "image",                        null: false
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.string   "kind"
    t.string   "description"
    t.string   "bio"
    t.string   "associations"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "rank",         default: 10000, null: false
    t.index ["active"], name: "index_doctors_on_active", using: :btree
    t.index ["last_name", "first_name"], name: "index_doctors_on_last_name_and_first_name", using: :btree
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id", using: :btree
  end

  create_table "faqs", force: :cascade do |t|
    t.boolean  "active",     default: false, null: false
    t.integer  "rank",       default: 10000, null: false
    t.string   "question",                   null: false
    t.text     "answer",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["active"], name: "index_faqs_on_active", using: :btree
    t.index ["rank"], name: "index_faqs_on_rank", using: :btree
  end

  create_table "procedures", force: :cascade do |t|
    t.boolean  "active",       default: false, null: false
    t.integer  "specialty_id",                 null: false
    t.string   "name",                         null: false
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "doctor_id"
    t.integer  "body_part_id"
    t.index ["active"], name: "index_procedures_on_active", using: :btree
    t.index ["name"], name: "index_procedures_on_name", using: :btree
    t.index ["specialty_id"], name: "index_procedures_on_specialty_id", using: :btree
  end

  create_table "specialties", force: :cascade do |t|
    t.boolean  "active",      default: false, null: false
    t.integer  "parent_id"
    t.integer  "doctor_id"
    t.string   "name",                        null: false
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["active"], name: "index_specialties_on_active", using: :btree
    t.index ["doctor_id"], name: "index_specialties_on_doctor_id", using: :btree
    t.index ["name"], name: "index_specialties_on_name", using: :btree
    t.index ["parent_id"], name: "index_specialties_on_parent_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",           default: false, null: false
    t.string   "email",                           null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["admin"], name: "index_users_on_admin", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["last_name", "first_name"], name: "index_users_on_last_name_and_first_name", using: :btree
  end

  create_table "visions", force: :cascade do |t|
    t.boolean  "active",     default: false, null: false
    t.integer  "rank",       default: 10000, null: false
    t.string   "title",                      null: false
    t.text     "text",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["active"], name: "index_visions_on_active", using: :btree
    t.index ["rank"], name: "index_visions_on_rank", using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.boolean  "active",      default: false, null: false
    t.integer  "rank",        default: 10000, null: false
    t.integer  "parent_id"
    t.string   "name",                        null: false
    t.string   "file"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["active"], name: "index_visits_on_active", using: :btree
    t.index ["rank"], name: "index_visits_on_rank", using: :btree
  end

end
