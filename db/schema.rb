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

ActiveRecord::Schema.define(version: 20151016142119) do

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feses", force: :cascade do |t|
    t.string   "fesName",              null: false
    t.string   "adminName",            null: false
    t.string   "adminTwitterID",       null: false
    t.text     "description"
    t.string   "rule",                 null: false
    t.integer  "limitNumberOfTeam",    null: false
    t.datetime "startDate",            null: false
    t.datetime "registrationDeadline", null: false
    t.string   "adminCommunityName"
    t.string   "adminCommunityURL"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "adminUserID"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "fes_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "round"
    t.integer  "battleID"
    t.string   "leftUserID"
    t.string   "leftTeamName"
    t.string   "leftTwitterID"
    t.string   "leftNNID"
    t.string   "rightUserID"
    t.string   "rightTeamName"
    t.string   "rightTwitterID"
    t.string   "rightNNID"
    t.integer  "resultLeftWins"
    t.integer  "resultRightWins"
    t.integer  "leftWinsReportedByLeft"
    t.integer  "rightWinsReportedByLeft"
    t.integer  "leftWinsReportedByRight"
    t.integer  "rightWinsReportedByRight"
  end

  add_index "matches", ["fes_id"], name: "index_matches_on_fes_id"

  create_table "participations", force: :cascade do |t|
    t.integer  "fes_id"
    t.string   "teamName",   null: false
    t.string   "TwitterID",  null: false
    t.string   "NNID",       null: false
    t.string   "UserID",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participations", ["fes_id"], name: "index_participations_on_fes_id"

  create_table "tables", force: :cascade do |t|
    t.integer  "fes_id"
    t.string   "teamName"
    t.string   "UserID"
    t.integer  "teamNumber"
    t.integer  "seedNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tables", ["fes_id"], name: "index_tables_on_fes_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
