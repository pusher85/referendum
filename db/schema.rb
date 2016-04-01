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

ActiveRecord::Schema.define(version: 20160401162051) do

  create_table "finales", force: :cascade do |t|
    t.integer  "seggi_id",   limit: 4
    t.integer  "si",         limit: 4
    t.integer  "no",         limit: 4
    t.integer  "bianche",    limit: 4
    t.integer  "nulle",      limit: 4
    t.integer  "contestate", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "primas", force: :cascade do |t|
    t.integer  "seggi_id",   limit: 4
    t.integer  "maschi",     limit: 4
    t.integer  "femmine",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "rilevazionis", force: :cascade do |t|
    t.integer  "uno_m",      limit: 4
    t.integer  "uno_f",      limit: 4
    t.integer  "due_m",      limit: 4
    t.integer  "due_f",      limit: 4
    t.integer  "tre_m",      limit: 4
    t.integer  "tre_f",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "seggi_id",   limit: 4
  end

  create_table "secondas", force: :cascade do |t|
    t.integer  "seggi_id",   limit: 4
    t.integer  "maschi",     limit: 4
    t.integer  "femmine",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "seggis", force: :cascade do |t|
    t.text     "descrizione", limit: 65535
    t.integer  "numero",      limit: 4
    t.integer  "maschi",      limit: 4
    t.integer  "femmine",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "terzas", force: :cascade do |t|
    t.integer  "seggi_id",   limit: 4
    t.integer  "maschi",     limit: 4
    t.integer  "femmine",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
