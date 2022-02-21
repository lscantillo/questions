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

ActiveRecord::Schema.define(version: 2022_02_15_185218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "text_content", limit: 3100
    t.string "session_hash", limit: 255
    t.boolean "is_answer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id"
    t.bigint "question_id"
    t.index ["employee_id"], name: "index_comments_on_employee_id"
    t.index ["question_id"], name: "index_comments_on_question_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 30
    t.boolean "is_active", default: true
    t.string "abbreviation", limit: 6
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name", limit: 255
    t.string "email", limit: 255
    t.boolean "is_admin", default: false
    t.string "job_title", limit: 255
    t.string "profile_picture_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text_content", limit: 600
    t.string "user_hash", limit: 255
    t.boolean "is_anonymous", default: true
    t.string "location", limit: 255
    t.datetime "last_email_notification_date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id"
    t.bigint "assigned_to_employee_id"
    t.bigint "department_id"
    t.index ["assigned_to_employee_id"], name: "index_questions_on_assigned_to_employee_id"
    t.index ["department_id"], name: "index_questions_on_department_id"
    t.index ["employee_id"], name: "index_questions_on_employee_id"
  end

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "question_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "is_up_vote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "question_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_votes_on_employee_id"
    t.index ["question_id"], name: "index_votes_on_question_id"
  end

  add_foreign_key "comments", "employees"
  add_foreign_key "comments", "questions"
  add_foreign_key "employees", "departments"
  add_foreign_key "questions", "departments"
  add_foreign_key "questions", "employees"
  add_foreign_key "questions", "employees", column: "assigned_to_employee_id"
  add_foreign_key "questions_tags", "questions"
  add_foreign_key "questions_tags", "tags"
  add_foreign_key "votes", "employees"
  add_foreign_key "votes", "questions"
end
