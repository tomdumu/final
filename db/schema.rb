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

ActiveRecord::Schema.define(version: 20150524223536) do

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "date"
    t.text     "content"
    t.integer  "commenter_id"
  end

  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "leader_id"
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"
  add_index "follows", ["leader_id"], name: "index_follows_on_leader_id"

  create_table "forums", force: :cascade do |t|
    t.text    "description"
    t.integer "admin_id"
    t.string  "forum_name"
  end

  add_index "forums", ["admin_id"], name: "index_forums_on_admin_id"

  create_table "levels", force: :cascade do |t|
    t.integer "user_id"
    t.float   "level"
  end

  add_index "levels", ["user_id"], name: "index_levels_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.boolean  "top",       default: false
    t.boolean  "important", default: false
    t.integer  "forum_id"
    t.integer  "poster_id"
    t.integer  "level"
  end

  add_index "posts", ["forum_id"], name: "index_posts_on_forum_id"
  add_index "posts", ["poster_id"], name: "index_posts_on_poster_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.datetime "birthday"
    t.string   "real_name"
    t.string   "address"
    t.string   "email"
    t.string   "gender"
    t.text     "avatar"
    t.string   "password_digest"
  end

  create_table "watches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "forum_id"
  end

  add_index "watches", ["forum_id"], name: "index_watches_on_forum_id"
  add_index "watches", ["user_id"], name: "index_watches_on_user_id"

end
