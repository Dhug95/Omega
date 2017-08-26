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

ActiveRecord::Schema.define(version: 20170826111236) do

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "favouriters_and_favourites", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.index ["property_id"], name: "index_favouriters_and_favourites_on_property_id"
    t.index ["user_id"], name: "index_favouriters_and_favourites_on_user_id"
  end

  create_table "following_connections", id: false, force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "titolo"
    t.text "descrizione"
    t.float "prezzo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "city"
    t.string "img1_file_name"
    t.string "img1_content_type"
    t.integer "img1_file_size"
    t.datetime "img1_updated_at"
    t.string "img2_file_name"
    t.string "img2_content_type"
    t.integer "img2_file_size"
    t.datetime "img2_updated_at"
    t.string "img3_file_name"
    t.string "img3_content_type"
    t.integer "img3_file_size"
    t.datetime "img3_updated_at"
    t.integer "valutation"
    t.float "latitude"
    t.float "longitude"
    t.string "categories"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "valutation"
    t.index ["property_id"], name: "index_questions_on_property_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "valutation"
    t.integer "property_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reviews_on_property_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
