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

ActiveRecord::Schema.define(version: 2018_05_10_073043) do

  create_table "my_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_my_classes_on_name", unique: true
  end

  create_table "my_classes_professors", id: false, force: :cascade do |t|
    t.integer "my_class_id", null: false
    t.integer "professor_id", null: false
    t.index ["my_class_id", "professor_id"], name: "index_my_classes_professors_on_my_class_id_and_professor_id"
    t.index ["professor_id", "my_class_id"], name: "index_my_classes_professors_on_professor_id_and_my_class_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_professors_on_first_name"
    t.index ["last_name"], name: "index_professors_on_last_name"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "professor_id"
    t.integer "my_class_id"
    t.index ["my_class_id"], name: "index_reviews_on_my_class_id"
    t.index ["professor_id"], name: "index_reviews_on_professor_id"
  end

end
