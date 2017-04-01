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

ActiveRecord::Schema.define(version: 20100404220531) do

  create_table "admission_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "admission_id"
    t.integer  "version"
    t.integer  "patient_id",                       default: 0
    t.integer  "area_id",                          default: 0
    t.string   "admission"
    t.date     "planned_date"
    t.date     "admission_date"
    t.date     "discharge_date"
    t.integer  "room"
    t.datetime "updated_at"
    t.integer  "is_private_patient"
    t.integer  "is_urgent"
    t.integer  "user_id",                          default: 0
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "recommendation",     limit: 65535
    t.integer  "admission_number"
    t.integer  "is_current"
    t.index ["area_id"], name: "index_admission_versions_on_area_id", using: :btree
    t.index ["patient_id"], name: "index_admission_versions_on_patient_id", using: :btree
  end

  create_table "admissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",                       default: 0, null: false
    t.integer  "area_id",                          default: 0
    t.date     "planned_date"
    t.date     "admission_date"
    t.date     "discharge_date"
    t.integer  "room"
    t.integer  "lock_version",                     default: 0
    t.datetime "updated_at"
    t.integer  "is_private_patient"
    t.integer  "is_urgent"
    t.integer  "user_id",                          default: 0, null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "recommendation",     limit: 65535
    t.integer  "admission_number"
    t.integer  "is_current"
    t.index ["area_id"], name: "index_admissions_on_area_id", using: :btree
    t.index ["patient_id"], name: "index_admissions_on_patient_id", using: :btree
  end

  create_table "adverse_event_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "adverse_event_id"
    t.integer  "version"
    t.date     "date"
    t.text     "text",                         limit: 65535
    t.integer  "trialist_id"
    t.integer  "adverse_event_type_id"
    t.integer  "adverse_event_status_type_id"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name",                         limit: 65535
    t.integer  "correlation_type_id"
    t.integer  "modification_type_id"
    t.integer  "outcome_type_id"
    t.date     "report_date"
    t.integer  "is_seen_in_center"
    t.integer  "is_unexpected"
    t.date     "notification_date"
    t.date     "followup_date"
  end

  create_table "adverse_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.date     "date"
    t.text     "text",                         limit: 65535
    t.integer  "trialist_id"
    t.integer  "adverse_event_type_id"
    t.integer  "adverse_event_status_type_id"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name",                         limit: 65535
    t.integer  "modification_type_id"
    t.date     "report_date"
    t.integer  "is_seen_in_center"
    t.date     "notification_date"
    t.date     "followup_date"
  end

  create_table "allocation_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "allocation_id"
    t.integer  "version"
    t.string   "abbreviation"
    t.string   "text"
    t.integer  "protocol_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allocations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "abbreviation"
    t.string   "text"
    t.integer  "protocol_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allocations_chemotherapy_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "allocation_id"
    t.integer "chemotherapy_type_id"
  end

  create_table "area_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "area_id"
    t.integer  "version"
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.integer  "area_type",     default: 0
    t.datetime "updated_at"
    t.integer  "department_id", default: 0
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_type_id"
    t.integer  "bed_count"
    t.index ["department_id"], name: "index_area_versions_on_department_id", using: :btree
  end

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.integer  "area_type",     default: 0,  null: false
    t.integer  "lock_version",  default: 0
    t.datetime "updated_at"
    t.integer  "department_id", default: 0,  null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_type_id",  default: 64
    t.integer  "bed_count"
    t.index ["department_id"], name: "index_areas_on_department_id", using: :btree
  end

  create_table "areas_diseases", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "area_id"
    t.integer "disease_id"
  end

  create_table "areas_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "area_id"
    t.integer "user_id"
  end

  create_table "assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "filename"
    t.string   "title"
    t.string   "asset_version"
    t.date     "date"
    t.string   "content_type"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "author_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "author_id"
    t.integer  "version"
    t.integer  "guideline_id"
    t.integer  "user_id"
    t.integer  "first_author"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "guideline_id"
    t.integer  "user_id"
    t.integer  "first_author"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_name_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "brand_name_id"
    t.integer  "version"
    t.string   "name"
    t.integer  "drug_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "center_id"
  end

  create_table "brand_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "drug_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "center_id"
  end

  create_table "brand_names_contacts", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "brand_name_id"
    t.integer "contact_id"
  end

  create_table "brand_names_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "brand_name_id"
    t.integer "user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name",              limit: 100, default: "", null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.integer  "assetable_type_id"
    t.integer  "assets_count",                  default: 0
  end

  create_table "category_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "category_id"
    t.integer  "version"
    t.string   "name",              limit: 100, default: ""
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "assetable_type_id"
    t.integer  "assets_count",                  default: 0
  end

  create_table "center_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "center_id"
    t.integer  "version"
    t.string   "name",              limit: 100,   default: ""
    t.text     "address",           limit: 65535
    t.string   "zip",               limit: 20,    default: ""
    t.string   "city",              limit: 100,   default: ""
    t.string   "url",               limit: 100
    t.datetime "updated_at"
    t.integer  "departments_count"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "country_id"
    t.integer  "center_type_id"
  end

  create_table "centers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name",              limit: 100,   default: "", null: false
    t.text     "address",           limit: 65535,              null: false
    t.string   "zip",               limit: 20,    default: "", null: false
    t.string   "city",              limit: 100,   default: "", null: false
    t.string   "url",               limit: 100
    t.integer  "lock_version",                    default: 0
    t.datetime "updated_at"
    t.integer  "departments_count",               default: 0
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "country_id",                      default: 18
    t.integer  "center_type_id"
  end

  create_table "chemotherapy_type_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "chemotherapy_type_id"
    t.integer  "version"
    t.string   "name"
    t.text     "description",          limit: 65535
    t.integer  "interval"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "histories_count",                                            default: 0
    t.string   "blue_book_id"
    t.boolean  "has_courses"
    t.decimal  "limit",                              precision: 3, scale: 2
    t.integer  "hydration_type_id"
  end

  create_table "chemotherapy_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.integer  "interval"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "histories_count",                                         default: 0
    t.string   "blue_book_id"
    t.boolean  "has_courses"
    t.decimal  "limit",                           precision: 3, scale: 2
    t.integer  "hydration_type_id"
  end

  create_table "chemotherapy_types_diseases", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "disease_id"
    t.integer "chemotherapy_type_id"
  end

  create_table "concomitant_disease_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "concomitant_disease_id"
    t.integer  "version"
    t.integer  "patient_id"
    t.string   "name"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concomitant_diseases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "lock_version", default: 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conference_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "conference_id"
    t.integer  "version"
    t.integer  "user_id",       default: 0
    t.string   "name",          default: ""
    t.string   "location",      default: ""
    t.datetime "updated_at"
    t.integer  "frequency"
    t.integer  "hour"
    t.integer  "minute"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "weekday_id"
  end

  create_table "conferences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "user_id",      default: 0,  null: false
    t.string   "name",         default: "", null: false
    t.string   "location",     default: "", null: false
    t.integer  "lock_version", default: 0
    t.datetime "updated_at"
    t.integer  "frequency"
    t.integer  "hour"
    t.integer  "minute"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "weekday_id",   default: 6
  end

  create_table "conferences_diseases", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "conference_id"
    t.integer "disease_id"
  end

  create_table "constants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "type"
    t.string "constant_id"
    t.string "name_de"
    t.string "abbreviation"
    t.string "name"
    t.string "name_en"
  end

  create_table "contact_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "contact_id"
    t.integer  "version"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name_addition"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "email"
    t.string   "job_title"
    t.string   "business_unit"
    t.integer  "manufacturer_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name_addition"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "email"
    t.string   "job_title"
    t.string   "business_unit"
    t.integer  "manufacturer_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "day_id"
    t.integer  "version"
    t.integer  "dose_id"
    t.integer  "number"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["dose_id"], name: "index_day_versions_on_dose_id", using: :btree
  end

  create_table "days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "dose_id"
    t.integer  "number"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["dose_id"], name: "index_days_on_dose_id", using: :btree
  end

  create_table "department_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "department_id"
    t.integer  "version"
    t.integer  "center_id",                           default: 0
    t.integer  "discipline_id",                       default: 0
    t.string   "name"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "ldap_name"
    t.integer  "has_different_address"
    t.text     "address",               limit: 65535
    t.string   "zip"
    t.string   "city"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "center_id",                           default: 0, null: false
    t.integer  "discipline_id",                       default: 0
    t.string   "name"
    t.integer  "lock_version",                        default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "ldap_name"
    t.integer  "has_different_address"
    t.text     "address",               limit: 65535
    t.string   "zip"
    t.string   "city"
  end

  create_table "discipline_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "discipline_id"
    t.integer  "version"
    t.string   "name",          limit: 100, default: ""
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "disciplines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "discussion_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "discussion_id"
    t.integer  "version"
    t.integer  "patient_id",                   default: 0
    t.integer  "conference_id",                default: 0
    t.date     "discussed_at"
    t.text     "recommendation", limit: 65535
    t.datetime "updated_at"
    t.integer  "user_id",                      default: 0
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["conference_id"], name: "index_discussion_versions_on_conference_id", using: :btree
    t.index ["patient_id"], name: "index_discussion_versions_on_patient_id", using: :btree
  end

  create_table "discussions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",                   default: 0, null: false
    t.integer  "conference_id",                default: 0, null: false
    t.date     "discussed_at"
    t.text     "recommendation", limit: 65535
    t.integer  "lock_version",                 default: 0
    t.datetime "updated_at"
    t.integer  "user_id",                      default: 0, null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["conference_id"], name: "index_discussions_on_conference_id", using: :btree
    t.index ["patient_id"], name: "index_discussions_on_patient_id", using: :btree
  end

  create_table "disease_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "disease_id"
    t.integer  "version"
    t.string   "name_de",      default: ""
    t.string   "abbreviation"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "diseases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name_de",      default: "", null: false
    t.string   "abbreviation"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "diseases_operation_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "disease_id"
    t.integer "operation_type_id"
  end

  create_table "diseases_parameters", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "disease_id"
    t.integer "parameter_id"
  end

  create_table "diseases_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "disease_id"
    t.integer "user_id"
  end

  create_table "disorder_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "disorder_id"
    t.integer  "version"
    t.integer  "patient_id",  default: 0
    t.integer  "disease_id",  default: 0
    t.integer  "stage_id",    default: 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["disease_id"], name: "index_disorder_versions_on_disease_id", using: :btree
    t.index ["patient_id"], name: "index_disorder_versions_on_patient_id", using: :btree
  end

  create_table "disorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",   default: 0
    t.integer  "disease_id",   default: 0
    t.integer  "stage_id",     default: 0
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["disease_id"], name: "index_disorders_on_disease_id", using: :btree
    t.index ["patient_id"], name: "index_disorders_on_patient_id", using: :btree
  end

  create_table "doses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "chemotherapy_type_id"
    t.integer  "drug_id"
    t.integer  "route_type_id"
    t.integer  "speed_type_id"
    t.integer  "position"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.decimal  "amount",               precision: 7, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "formula_type_id",                              default: 246
    t.integer  "volume_id"
    t.integer  "volume_type_id"
    t.integer  "times_daily",                                  default: 1
    t.integer  "is_sponsored"
    t.index ["drug_id"], name: "index_doses_on_drug_id", using: :btree
  end

  create_table "drugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "precision",                                         default: 0
    t.integer  "is_mixed_in_pharmacy",                              default: 0
    t.integer  "amount_type_id",                                    default: 231
    t.integer  "is_used_in_chemotherapy",                           default: 1
    t.integer  "rounding_type_id"
    t.decimal  "max_dose",                  precision: 7, scale: 2
    t.integer  "needs_creatinine"
    t.integer  "needs_bilirubin"
    t.integer  "is_concomitant_medication"
    t.integer  "emetogenic_type_id"
    t.integer  "allergic_type_id"
    t.integer  "hydration_type_id"
  end

  create_table "drugs_formula_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "drug_id"
    t.integer "formula_type_id"
  end

  create_table "drugs_route_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "drug_id"
    t.integer "route_type_id"
  end

  create_table "drugs_speed_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "drug_id"
    t.integer "speed_type_id"
  end

  create_table "drugs_volume_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "drug_id"
    t.integer "volume_type_id"
  end

  create_table "drugs_volumes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "drug_id"
    t.integer "volume_id"
  end

  create_table "entities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "protocol_id",  default: 0
    t.integer  "disease_id",   default: 0
    t.integer  "stage_id",     default: 0
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities_stages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "entity_id",    default: 0
    t.integer  "stage_id",     default: 0
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "story_id",                          default: 0, null: false
    t.integer  "examination_type_id"
    t.integer  "location_id"
    t.text     "text",                limit: 65535
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version",                      default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_types", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "adverse_event_id"
    t.integer "adverse_event_type_id"
  end

  create_table "functions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name_de",          limit: 100, default: "",    null: false
    t.boolean  "multiple",                     default: false, null: false
    t.integer  "parameters_count",             default: 0
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "guidelines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.string   "version",            limit: 11
    t.text     "text",               limit: 65535
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guideline_state_id",               default: 273
  end

  create_table "guidelines_results", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "guideline_id"
    t.integer "result_id"
  end

  create_table "help_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "role_id",    default: 0
    t.string  "name"
    t.string  "model_name"
  end

  create_table "help_texts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "help_category_id",               default: 0, null: false
    t.integer  "role_id",                        default: 0
    t.string   "name"
    t.text     "text",             limit: 65535
    t.integer  "version"
    t.integer  "lock_version",                   default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",                                      default: 0,             null: false
    t.integer  "kind",                                            default: 0,             null: false
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "end_year"
    t.integer  "end_month"
    t.integer  "end_day"
    t.string   "text"
    t.integer  "side"
    t.string   "histology"
    t.integer  "course"
    t.integer  "dose"
    t.integer  "transplantation"
    t.integer  "gvhd"
    t.integer  "cmv"
    t.integer  "examination"
    t.integer  "location"
    t.integer  "result"
    t.integer  "lock_version",                                    default: 0
    t.datetime "updated_at"
    t.integer  "date_kind"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "upn"
    t.string   "type",                                            default: "Examination"
    t.integer  "transplantation_type_id"
    t.integer  "examination_type_id",                             default: 100
    t.integer  "milestone_type_id"
    t.integer  "location_id"
    t.integer  "result_id"
    t.integer  "gvhd_id"
    t.integer  "cmv_id"
    t.integer  "side_id"
    t.integer  "coagulation_type_id"
    t.integer  "operation_type_id"
    t.integer  "chemotherapy_type_id"
    t.decimal  "weigth",                  precision: 4, scale: 1
    t.integer  "creatinine"
    t.integer  "reduction_type_id",                               default: 275
    t.integer  "disease_id"
    t.integer  "area_id"
    t.integer  "protocol_id"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "bilirubin"
    t.integer  "emetogenic_risk"
    t.index ["patient_id"], name: "index_histories_on_patient_id", using: :btree
  end

  create_table "incidents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.text     "name",                limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "adverse_event_id"
    t.integer  "grade"
    t.integer  "correlation_type_id"
    t.integer  "is_unexpected"
    t.integer  "outcome_type_id"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "lock_version", default: 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infections_patients", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "infection_id"
    t.integer "patient_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "parameter_id", default: 0, null: false
    t.integer  "protocol_id",  default: 0, null: false
    t.integer  "function_id",  default: 0, null: false
    t.integer  "lock_version", default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["parameter_id"], name: "index_items_on_parameter_id", using: :btree
    t.index ["protocol_id"], name: "index_items_on_protocol_id", using: :btree
  end

  create_table "levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "history_id"
    t.integer  "dose_id"
    t.integer  "reduction_type_id"
    t.integer  "position"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.decimal  "amount",            precision: 7, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "phone"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.integer  "country_id"
    t.integer  "manufacturer_type_id"
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "user_id",         default: 0, null: false
    t.integer  "conference_id",   default: 0, null: false
    t.integer  "moderation",      default: 0, null: false
    t.integer  "lock_version",    default: 0
    t.datetime "updated_at"
    t.datetime "participated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["conference_id"], name: "index_members_on_conference_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "objectives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",                 default: 0, null: false
    t.date     "date"
    t.text     "text",         limit: 65535
    t.text     "plan",         limit: 65535
    t.integer  "version"
    t.integer  "lock_version",               default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["patient_id"], name: "index_objectives_on_patient_id", using: :btree
  end

  create_table "operation_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "description"
    t.integer  "has_sides"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.integer  "histories_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations_schedules", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "operation_id"
    t.integer "schedule_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "history_id"
    t.integer  "start_day"
    t.integer  "end_day"
    t.integer  "is_ordered"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admission_id"
    t.integer  "attending_id"
    t.text     "comment",      limit: 65535
    t.integer  "area_id"
    t.date     "next_date"
  end

  create_table "parameters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "function_id",              default: 0,  null: false
    t.integer  "user_id",                  default: 0,  null: false
    t.string   "name_de",      limit: 100, default: "", null: false
    t.integer  "position",                 default: 0,  null: false
    t.integer  "lock_version",             default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "name"
    t.string   "name_en"
    t.index ["function_id"], name: "index_parameters_on_function_id", using: :btree
  end

  create_table "participants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "user_id",             default: 0, null: false
    t.integer  "protocol_id",         default: 0, null: false
    t.integer  "participant_type_id"
    t.integer  "lock_version",        default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["protocol_id"], name: "index_participants_on_protocol_id", using: :btree
    t.index ["user_id"], name: "index_participants_on_user_id", using: :btree
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "hospital_id",        limit: 10, default: "", null: false
    t.string   "first_name"
    t.string   "name_addition"
    t.string   "last_name"
    t.integer  "disease_id",                    default: 0
    t.integer  "lock_version",                  default: 0
    t.datetime "updated_at"
    t.date     "birthdate"
    t.integer  "version"
    t.string   "title"
    t.integer  "is_private_patient"
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "sex_id"
    t.integer  "infection_id"
    t.integer  "patient_state_id"
    t.date     "deceased_date"
    t.integer  "has_no_hospital_id",            default: 0
    t.integer  "height"
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "role_id"
    t.string   "controller"
    t.string   "action"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "physicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",   default: 0
    t.integer  "user_id",      default: 0
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protocols", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name_de",           limit: 80,    default: "", null: false
    t.text     "description_de",    limit: 65535
    t.string   "status",            limit: 2,     default: "", null: false
    t.string   "id_study",          limit: 20
    t.text     "rationale",         limit: 65535
    t.text     "protocol",          limit: 65535
    t.integer  "accrual"
    t.date     "date_activation"
    t.date     "date_closure"
    t.integer  "histology"
    t.integer  "measurable"
    t.integer  "cns"
    t.integer  "age_min"
    t.integer  "age_max"
    t.integer  "sex"
    t.integer  "performance"
    t.integer  "life_expectancy"
    t.integer  "leucocytes"
    t.integer  "hemoglobin"
    t.integer  "thrombocytes"
    t.integer  "bilirubin"
    t.integer  "transaminases"
    t.integer  "creatinine"
    t.integer  "infection"
    t.integer  "malignancy"
    t.integer  "hypersensivity"
    t.integer  "lock_version",                    default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "eudract"
    t.integer  "protocol_state_id",               default: 57
    t.integer  "sex_id"
    t.integer  "leucocyte_id"
    t.integer  "hemoglobin_id"
    t.integer  "thrombocyte_id"
    t.string   "nih_id"
    t.string   "url_study"
    t.date     "irb_date"
    t.string   "irb_number"
    t.date     "prestudy_date"
    t.date     "contract_date"
    t.date     "initiation_date"
    t.integer  "manufacturer_id"
    t.integer  "contact_id"
    t.string   "kks_id"
    t.integer  "center_id"
    t.date     "regulatory_date"
    t.string   "substance_de"
    t.integer  "accrual_total"
    t.integer  "center_number"
    t.string   "name"
    t.string   "name_en"
    t.text     "description",       limit: 65535
    t.text     "description_en",    limit: 65535
    t.string   "substance"
    t.string   "substance_en"
  end

  create_table "protocols_stages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "protocol_id",  default: 0
    t.integer  "stage_id",     default: 0
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "story_id",                   default: 0, null: false
    t.string   "name"
    t.text     "answer",       limit: 65535
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version",               default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.text     "text",         limit: 65535
    t.date     "date"
    t.integer  "patient_id"
    t.integer  "guideline_id"
    t.integer  "user_id"
    t.integer  "result_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "users_count", default: 0, null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "area_id",      default: 0,  null: false
    t.integer  "number"
    t.integer  "beds"
    t.integer  "lock_version", default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "side_id",      default: 16
  end

  create_table "screenings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "protocol_id",                     default: 0
    t.integer  "patient_id",                      default: 0
    t.integer  "screening_type_id"
    t.date     "date"
    t.text     "text",              limit: 65535
    t.integer  "version"
    t.integer  "lock_version",                    default: 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "disease_id",   default: 0
    t.string   "name_de"
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version", default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "stages_topics", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "stage_id"
    t.integer "topic_id"
  end

  create_table "stories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "disease_id",                         default: 0, null: false
    t.string   "name"
    t.string   "text"
    t.text     "history",              limit: 65535
    t.text     "physical_examination", limit: 65535
    t.integer  "version"
    t.integer  "lock_version",                       default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "user_id",          default: 0, null: false
    t.integer  "patient_id",       default: 0
    t.string   "text"
    t.integer  "priority_type_id"
    t.date     "due_date"
    t.date     "completed_date"
    t.integer  "version"
    t.integer  "lock_version",     default: 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timepoints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "disorder_id",       default: 0
    t.integer  "timepoint_type_id"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "lock_version",      default: 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["disorder_id"], name: "index_timepoints_on_disorder_id", using: :btree
  end

  create_table "topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "name"
    t.integer  "guideline_id"
    t.integer  "disease_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transcripts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "conference_id", default: 0, null: false
    t.date     "date"
    t.integer  "lock_version",  default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.index ["conference_id"], name: "index_transcripts_on_conference_id", using: :btree
  end

  create_table "transcripts_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "transcript_id"
    t.integer "user_id"
  end

  create_table "trialists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "patient_id",                      default: 0, null: false
    t.integer  "protocol_id",                     default: 0, null: false
    t.string   "id_study"
    t.date     "date_consent"
    t.integer  "lock_version",                    default: 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "trialist_type_id"
    t.integer  "user_id"
    t.text     "text",              limit: 65535
    t.date     "date_registration"
    t.integer  "allocation_id"
    t.date     "date_screening"
    t.date     "date_conclusion"
    t.index ["patient_id"], name: "index_trialists_on_patient_id", using: :btree
    t.index ["protocol_id"], name: "index_trialists_on_protocol_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "role_id",                     default: 0, null: false
    t.string   "hashed_password",  limit: 40
    t.string   "title",            limit: 40
    t.string   "first_name",       limit: 40
    t.string   "last_name",        limit: 80
    t.string   "phone",            limit: 20
    t.string   "fax",              limit: 20
    t.string   "email",            limit: 80
    t.integer  "lock_version",                default: 0
    t.datetime "updated_at"
    t.string   "pager"
    t.integer  "department_id",               default: 0, null: false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "login"
    t.integer  "user_type_id"
    t.string   "name_addition"
    t.string   "mobile"
    t.integer  "scopus_author_id"
  end

end
