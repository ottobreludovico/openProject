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

ActiveRecord::Schema.define(version: 2019_07_03_151626) do

  create_table "cards", force: :cascade do |t|
    t.integer "list_id"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_chat_messages_on_project_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

# Could not dump table "joins" because of following StandardError
#   Unknown type 'bool' for column 'accepted'

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "project_id"
    t.integer "creator_id"
    t.text "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_messages_on_creator_id"
    t.index ["project_id"], name: "index_messages_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "teamleader_id"
    t.string "title"
    t.text "description"
    t.integer "number_of_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teamleader_id"], name: "index_projects_on_teamleader_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "assigned_to_id"
    t.integer "project_id"
    t.text "note"
    t.integer "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_reviews_on_assigned_to_id"
    t.index ["creator_id"], name: "index_reviews_on_creator_id"
    t.index ["project_id"], name: "index_reviews_on_project_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.integer "project_id"
    t.integer "creator_id"
    t.integer "worker_id"
    t.string "title"
    t.text "description"
    t.date "deadline"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_user_stories_on_creator_id"
    t.index ["project_id"], name: "index_user_stories_on_project_id"
    t.index ["worker_id"], name: "index_user_stories_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "provider"
    t.string "uid"
    t.boolean "admin"
    t.date "birthday"
    t.text "location"
    t.string "username"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
