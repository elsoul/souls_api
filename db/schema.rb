# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_164603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_target_lists", force: :cascade do |t|
    t.string "user_id"
    t.bigint "tw_id", default: 0
    t.string "name"
    t.string "screen_name"
    t.string "status"
    t.integer "done_following", default: 0
    t.integer "follow_back", default: 0
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "location"
    t.boolean "verified", default: false
    t.integer "followers_count", default: 0
    t.integer "friends_count", default: 0
    t.integer "listed_count", default: 0
    t.integer "favourites_count", default: 0
    t.integer "statuses_count", default: 0
    t.date "account_created_at"
    t.string "profile_banner_url"
    t.string "profile_image_url_https"
    t.boolean "following", default: false
    t.boolean "followed_by_this_user", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_account_target_lists_on_user_id"
  end

  create_table "article_categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total_articles", default: 0
    t.text "tag", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_series", force: :cascade do |t|
    t.string "name", null: false
    t.string "category"
    t.integer "total_episodes", default: 0
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category"], name: "index_article_series_on_category"
    t.index ["name"], name: "index_article_series_on_name"
  end

  create_table "articles", force: :cascade do |t|
    t.string "user_id"
    t.string "title", null: false
    t.text "body", null: false
    t.string "thumnail_url", null: false
    t.datetime "public_date", null: false
    t.bigint "article_category_id", null: false
    t.boolean "is_public", default: false
    t.text "tag", default: [], array: true
    t.boolean "has_series", default: false
    t.integer "series_id", default: 0
    t.integer "episode_num", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_category_id"], name: "index_articles_on_article_category_id"
    t.index ["has_series"], name: "index_articles_on_has_series"
    t.index ["is_public"], name: "index_articles_on_is_public"
    t.index ["tag"], name: "index_articles_on_tag"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "key_groups", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.integer "total_key_num", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "targets_followers", force: :cascade do |t|
    t.bigint "account_target_list_id", null: false
    t.bigint "tw_id"
    t.string "name"
    t.string "screen_name"
    t.string "status"
    t.boolean "done"
    t.boolean "follow_back"
    t.datetime "followed_at"
    t.datetime "unfollowed_at"
    t.string "location"
    t.boolean "verified"
    t.integer "followers_count"
    t.integer "friends_count"
    t.integer "listed_count"
    t.integer "favourites_count"
    t.integer "statuses_count"
    t.date "account_created_at"
    t.string "profile_banner_url"
    t.string "profile_image_url_https"
    t.boolean "following"
    t.boolean "followed_by_this_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_target_list_id"], name: "index_targets_followers_on_account_target_list_id"
  end

  create_table "twitter_lists", force: :cascade do |t|
    t.string "user_id"
    t.string "category", default: "N"
    t.text "tag", default: [], array: true
    t.bigint "tw_id"
    t.string "name"
    t.string "screen_name"
    t.string "location"
    t.boolean "verified"
    t.integer "followers_count"
    t.integer "friends_count"
    t.integer "listed_count"
    t.integer "favourites_count"
    t.integer "statuses_count"
    t.datetime "account_created_at"
    t.string "profile_banner_url"
    t.string "profile_image_url_https"
    t.boolean "following"
    t.boolean "followed_by_this_user", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category"], name: "index_twitter_lists_on_category"
    t.index ["followed_by_this_user"], name: "index_twitter_lists_on_followed_by_this_user"
    t.index ["followers_count"], name: "index_twitter_lists_on_followers_count"
    t.index ["following"], name: "index_twitter_lists_on_following"
    t.index ["screen_name"], name: "index_twitter_lists_on_screen_name"
    t.index ["tag"], name: "index_twitter_lists_on_tag"
    t.index ["user_id"], name: "index_twitter_lists_on_user_id"
  end

  create_table "user_keys", force: :cascade do |t|
    t.string "user_id"
    t.bigint "key_group_id", null: false
    t.text "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_group_id"], name: "index_user_keys_on_key_group_id"
    t.index ["user_id"], name: "index_user_keys_on_user_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "username"
    t.string "screen_name"
    t.string "email"
    t.string "icon_url"
    t.string "birthday"
    t.string "lang"
    t.integer "roles_mask"
    t.integer "total_articles", default: 0
    t.integer "total_tweets", default: 0
    t.integer "gem"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["screen_name"], name: "index_users_on_screen_name"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "articles", "article_categories"
  add_foreign_key "targets_followers", "account_target_lists"
  add_foreign_key "user_keys", "key_groups"
end
