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

ActiveRecord::Schema.define(version: 20160728173355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insurance_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.integer  "cpf"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "email"
    t.string   "marital_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "integer"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.integer  "vehicle_model_id"
    t.boolean  "has_alarm"
    t.boolean  "has_blocker_ignition"
    t.boolean  "has_tracker"
    t.boolean  "funded_alienated"
    t.boolean  "has_armor"
    t.boolean  "has_gaskit"
    t.boolean  "has_chassis_remarked"
    t.string   "cep"
    t.string   "cep_night"
    t.boolean  "has_house_park"
    t.boolean  "has_house_remote_control"
    t.boolean  "use_go_work"
    t.boolean  "has_work_park"
    t.boolean  "has_work_remote_control"
    t.boolean  "use_commercial"
    t.boolean  "use_go_study"
    t.boolean  "has_study_park"
    t.boolean  "has_study_remote_control"
    t.integer  "km_daily"
    t.integer  "number"
    t.string   "contact_name"
    t.string   "contact_email"
    t.integer  "insurance_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "status"
    t.string   "driver_name"
    t.string   "driver_cpf"
    t.string   "driver_gender"
    t.date     "driver_birth_date"
    t.string   "driver_marital_status"
    t.boolean  "has_driver_dependent"
    t.integer  "enabling_time"
    t.string   "home_cep"
    t.boolean  "has_other_vehicles"
    t.string   "schooling"
    t.string   "professional_activity"
    t.boolean  "was_stolen"
    t.boolean  "driver_is_insured"
    t.boolean  "driver_is_owner"
    t.string   "owner_name"
    t.string   "owner_cpf"
    t.string   "owner_email"
    t.string   "owner_gender"
    t.date     "owner_birth_date"
    t.string   "owner_marital_status"
    t.boolean  "owner_is_driver"
    t.string   "insured_name"
    t.string   "insured_cpf"
    t.string   "insured_email"
    t.string   "insured_gender"
    t.date     "insured_birth_date"
    t.string   "insured_marital_status"
    t.boolean  "insured_is_driver"
    t.boolean  "insured_is_owner"
    t.index ["insurance_type_id"], name: "index_quotations_on_insurance_type_id", using: :btree
    t.index ["vehicle_model_id"], name: "index_quotations_on_vehicle_model_id", using: :btree
  end

  create_table "vehicle_brands", force: :cascade do |t|
    t.string   "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "model"
    t.integer  "vehicle_brand_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "year"
    t.string   "fuel"
    t.decimal  "price"
    t.index ["vehicle_brand_id"], name: "index_vehicle_models_on_vehicle_brand_id", using: :btree
  end

  add_foreign_key "quotations", "insurance_types"
  add_foreign_key "quotations", "vehicle_models"
  add_foreign_key "vehicle_models", "vehicle_brands"
end
