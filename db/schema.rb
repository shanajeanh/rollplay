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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161020175617) do
=======
ActiveRecord::Schema.define(version: 20161021180835) do
>>>>>>> 11d0905780d6103dbd6b12a270fc195cde243a4d

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "character_class",                    null: false
    t.string   "character_race",                     null: false
    t.text     "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "level"
    t.text     "appearance"
    t.string   "alignment"
    t.string   "deity"
    t.string   "size",            default: "Medium"
    t.integer  "str",             default: 10
    t.integer  "dex",             default: 10
    t.integer  "con",             default: 10
    t.integer  "int",             default: 10
    t.integer  "wis",             default: 10
    t.integer  "cha",             default: 10
    t.integer  "speed",           default: 30
    t.integer  "hp"
    t.integer  "fort",            default: 0
    t.integer  "ref",             default: 0
    t.integer  "will",            default: 0
    t.integer  "bab",             default: 0
<<<<<<< HEAD
    t.integer  "user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.boolean "class_skill",  default: false
    t.integer "added_ranks",  default: 0
    t.integer "character_id",                 null: false
    t.integer "skill_id",                     null: false
    t.index ["character_id"], name: "index_ranks_on_character_id", using: :btree
    t.index ["skill_id"], name: "index_ranks_on_skill_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string "name",    null: false
    t.string "ability", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "last_signed_in_at"
    t.string   "username"
    t.string   "oauth_uid"
    t.integer  "sign_in_count",     default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["oauth_uid"], name: "index_users_on_oauth_uid", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
=======
    t.integer  "user_id",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
>>>>>>> 11d0905780d6103dbd6b12a270fc195cde243a4d
  end

end
