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

ActiveRecord::Schema.define(version: 20160816111214) do

  create_table "aim_license_containers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anony_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "anony_post_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "anony_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "anony_post_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "book_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
  end

  create_table "bridge_major_and_licenses", force: :cascade do |t|
    t.integer  "license_id"
    t.integer  "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "got_license_containers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "got_licenses", force: :cascade do |t|
    t.string   "qualifyitem"
    t.string   "enrollnum"
    t.string   "grade"
    t.date     "enrolldate"
    t.date     "issuedate"
    t.string   "etc"
    t.integer  "got_license_container_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "isofficial"
    t.string   "implementagency"
    t.string   "description"
    t.integer  "aim_license_container"
    t.integer  "like_license_container"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "like_license_containers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practice_test_schedules", force: :cascade do |t|
    t.date     "appdatestart"
    t.date     "appdateend"
    t.date     "testdatestart"
    t.date     "testdateend"
    t.date     "testresultdate"
    t.integer  "test_schedule_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "test_schedules", force: :cascade do |t|
    t.boolean  "iswtest"
    t.boolean  "isptest"
    t.integer  "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname"
    t.string   "major"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "written_test_schedules", force: :cascade do |t|
    t.date     "appdatestart"
    t.date     "appdateend"
    t.date     "testdate"
    t.date     "testresultdate"
    t.integer  "test_schedule_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
