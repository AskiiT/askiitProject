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

ActiveRecord::Schema.define(version: 20170422005613) do

  create_table "avatars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatars"
  end

  create_table "domain_ranks", force: :cascade do |t|
    t.integer  "level",      default: 0, null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "picture_id"
    t.index ["picture_id"], name: "index_domain_ranks_on_picture_id"
    t.index ["topic_id"], name: "index_domain_ranks_on_topic_id"
    t.index ["user_id"], name: "index_domain_ranks_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "followed_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_followers_on_followed_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "level_picture"
  end

  create_table "postulates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_postulates_on_question_id"
    t.index ["user_id"], name: "index_postulates_on_user_id"
  end

  create_table "question_attachments", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "attachment"
    t.index ["question_id"], name: "index_question_attachments_on_question_id"
  end

  create_table "question_has_tags", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_has_tags_on_question_id"
    t.index ["tag_id"], name: "index_question_has_tags_on_tag_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "body"
    t.datetime "date_posted",             null: false
    t.integer  "difficulty",  default: 1, null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer  "clarity",      default: 0, null: false
    t.integer  "quickness",    default: 0, null: false
    t.integer  "efectiveness", default: 0, null: false
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_ranks_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name",   null: false
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
    t.index ["topic_id"], name: "index_tags_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "topic_name",        null: false
    t.text     "topic_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "color"
    t.index ["topic_name"], name: "index_topics_on_topic_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email",               null: false
    t.string   "uid",                    default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name",                                             null: false
    t.string   "last_name",                                              null: false
    t.string   "email",                                                  null: false
    t.string   "username",                                               null: false
    t.datetime "date_created",           default: '2017-04-24 00:00:00', null: false
    t.text     "description",            default: ""
    t.text     "tokens"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "color",                  default: "ffffff"
    t.integer  "avatar_id",              default: 1
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
