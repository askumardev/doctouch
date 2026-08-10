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

ActiveRecord::Schema[8.1].define(version: 2026_08_10_124602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.bigint "author_id"
    t.string "author_type"
    t.text "body"
    t.datetime "created_at", null: false
    t.string "namespace"
    t.bigint "resource_id"
    t.string "resource_type"
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "branches", force: :cascade do |t|
    t.text "address"
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.string "registration_number"
    t.string "status"
    t.string "subscription_plan"
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_branches_on_clinic_id"
  end

  create_table "clinic_memberships", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.bigint "role_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["clinic_id"], name: "index_clinic_memberships_on_clinic_id"
    t.index ["role_id"], name: "index_clinic_memberships_on_role_id"
    t.index ["user_id"], name: "index_clinic_memberships_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.string "registration_number"
    t.string "status"
    t.string "subscription_plan"
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.decimal "consultation_fee"
    t.datetime "created_at", null: false
    t.integer "experience_years"
    t.string "qualification"
    t.string "registration_number"
    t.string "specialization"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "blood_group"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "emergency_contact"
    t.string "gender"
    t.string "phone"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "receptionists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "employee_code"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_receptionists_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "role_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "last_login_at"
    t.string "password_digest"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branches", "clinics"
  add_foreign_key "clinic_memberships", "clinics"
  add_foreign_key "clinic_memberships", "roles"
  add_foreign_key "clinic_memberships", "users"
  add_foreign_key "doctors", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "receptionists", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
