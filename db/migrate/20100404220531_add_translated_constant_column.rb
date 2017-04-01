class AddTranslatedConstantColumn < ActiveRecord::Migration
  create_table "admissions", :force => true do |t|
    t.integer  "patient_id",         :default => 0, :null => false
    t.integer  "area_id",            :default => 0
    t.date     "planned_date"
    t.date     "admission_date"
    t.date     "discharge_date"
    t.integer  "room"
    t.integer  "lock_version",       :default => 0
    t.datetime "updated_at"
    t.integer  "is_private_patient"
    t.integer  "is_urgent"
    t.integer  "user_id",            :default => 0, :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "recommendation"
    t.integer  "admission_number"
    t.integer  "is_current"
  end

  add_index "admissions", ["area_id"], :name => "index_admissions_on_area_id"
  add_index "admissions", ["patient_id"], :name => "index_admissions_on_patient_id"

  create_table "adverse_events", :force => true do |t|
    t.date     "date"
    t.text     "text"
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
    t.text     "name"
    t.integer  "modification_type_id"
    t.date     "report_date"
    t.integer  "is_seen_in_center"
    t.date     "notification_date"
    t.date     "followup_date"
  end

  create_table "allocations", :force => true do |t|
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

  create_table "allocations_chemotherapy_types", :id => false, :force => true do |t|
    t.integer "allocation_id"
    t.integer "chemotherapy_type_id"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.integer  "area_type",     :default => 0,  :null => false
    t.integer  "lock_version",  :default => 0
    t.datetime "updated_at"
    t.integer  "department_id", :default => 0,  :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_type_id",  :default => 64
    t.integer  "bed_count"
  end

  add_index "areas", ["department_id"], :name => "index_areas_on_department_id"

  create_table "areas_diseases", :id => false, :force => true do |t|
    t.integer "area_id"
    t.integer "disease_id"
  end

  create_table "areas_users", :id => false, :force => true do |t|
    t.integer "area_id"
    t.integer "user_id"
  end

  create_table "assets", :force => true do |t|
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

  create_table "authors", :force => true do |t|
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

  create_table "brand_names", :force => true do |t|
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

  create_table "brand_names_contacts", :id => false, :force => true do |t|
    t.integer "brand_name_id"
    t.integer "contact_id"
  end

  create_table "brand_names_users", :id => false, :force => true do |t|
    t.integer "brand_name_id"
    t.integer "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",              :limit => 100, :default => "", :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.integer  "assetable_type_id"
    t.integer  "assets_count",                     :default => 0
  end

  create_table "centers", :force => true do |t|
    t.string   "name",              :limit => 100, :default => "", :null => false
    t.text     "address",                                          :null => false
    t.string   "zip",               :limit => 20,  :default => "", :null => false
    t.string   "city",              :limit => 100, :default => "", :null => false
    t.string   "url",               :limit => 100
    t.integer  "lock_version",                     :default => 0
    t.datetime "updated_at"
    t.integer  "departments_count",                :default => 0
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "country_id",                       :default => 18
    t.integer  "center_type_id"
  end

  create_table "chemotherapy_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "interval"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "histories_count",                                 :default => 0
    t.string   "blue_book_id"
    t.boolean  "has_courses"
    t.decimal  "limit",             :precision => 3, :scale => 2
    t.integer  "hydration_type_id"
  end

  create_table "chemotherapy_types_diseases", :id => false, :force => true do |t|
    t.integer "disease_id"
    t.integer "chemotherapy_type_id"
  end

  create_table "concomitant_diseases", :force => true do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "lock_version", :default => 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", :force => true do |t|
    t.integer  "user_id",      :default => 0,  :null => false
    t.string   "name",         :default => "", :null => false
    t.string   "location",     :default => "", :null => false
    t.integer  "lock_version", :default => 0
    t.datetime "updated_at"
    t.integer  "frequency"
    t.integer  "hour"
    t.integer  "minute"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "weekday_id",   :default => 6
  end

  create_table "conferences_diseases", :id => false, :force => true do |t|
    t.integer "conference_id"
    t.integer "disease_id"
  end

  create_table "constants", :force => true do |t|
    t.string "type"
    t.string "constant_id"
    t.string "name_de"
    t.string "abbreviation"
    t.string "name"
    t.string "name_en"
  end

  create_table "contacts", :force => true do |t|
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

  create_table "days", :force => true do |t|
    t.integer  "dose_id"
    t.integer  "number"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["dose_id"], :name => "index_days_on_dose_id"

  create_table "departments", :force => true do |t|
    t.integer  "center_id",             :default => 0, :null => false
    t.integer  "discipline_id",         :default => 0
    t.string   "name"
    t.integer  "lock_version",          :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "ldap_name"
    t.integer  "has_different_address"
    t.text     "address"
    t.string   "zip"
    t.string   "city"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "name",       :limit => 100, :default => "", :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "discussions", :force => true do |t|
    t.integer  "patient_id",     :default => 0, :null => false
    t.integer  "conference_id",  :default => 0, :null => false
    t.date     "discussed_at"
    t.text     "recommendation"
    t.integer  "lock_version",   :default => 0
    t.datetime "updated_at"
    t.integer  "user_id",        :default => 0, :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "discussions", ["conference_id"], :name => "index_discussions_on_conference_id"
  add_index "discussions", ["patient_id"], :name => "index_discussions_on_patient_id"

  create_table "diseases", :force => true do |t|
    t.string   "name_de",      :default => "", :null => false
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

  create_table "diseases_operation_types", :id => false, :force => true do |t|
    t.integer "disease_id"
    t.integer "operation_type_id"
  end

  create_table "diseases_parameters", :id => false, :force => true do |t|
    t.integer "disease_id"
    t.integer "parameter_id"
  end

  create_table "diseases_users", :id => false, :force => true do |t|
    t.integer "disease_id"
    t.integer "user_id"
  end

  create_table "disorders", :force => true do |t|
    t.integer  "patient_id",   :default => 0
    t.integer  "disease_id",   :default => 0
    t.integer  "stage_id",     :default => 0
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disorders", ["disease_id"], :name => "index_disorders_on_disease_id"
  add_index "disorders", ["patient_id"], :name => "index_disorders_on_patient_id"

  create_table "doses", :force => true do |t|
    t.integer  "chemotherapy_type_id"
    t.integer  "drug_id"
    t.integer  "route_type_id"
    t.integer  "speed_type_id"
    t.integer  "position"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.decimal  "amount",               :precision => 7, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "formula_type_id",                                    :default => 246
    t.integer  "volume_id"
    t.integer  "volume_type_id"
    t.integer  "times_daily",                                        :default => 1
    t.integer  "is_sponsored"
  end

  add_index "doses", ["drug_id"], :name => "index_doses_on_drug_id"

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "precision",                                               :default => 0
    t.integer  "is_mixed_in_pharmacy",                                    :default => 0
    t.integer  "amount_type_id",                                          :default => 231
    t.integer  "is_used_in_chemotherapy",                                 :default => 1
    t.integer  "rounding_type_id"
    t.decimal  "max_dose",                  :precision => 7, :scale => 2
    t.integer  "needs_creatinine"
    t.integer  "needs_bilirubin"
    t.integer  "is_concomitant_medication"
    t.integer  "emetogenic_type_id"
    t.integer  "allergic_type_id"
    t.integer  "hydration_type_id"
  end

  create_table "drugs_formula_types", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "formula_type_id"
  end

  create_table "drugs_route_types", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "route_type_id"
  end

  create_table "drugs_speed_types", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "speed_type_id"
  end

  create_table "drugs_volume_types", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "volume_type_id"
  end

  create_table "drugs_volumes", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "volume_id"
  end

  create_table "entities", :force => true do |t|
    t.integer  "protocol_id",  :default => 0
    t.integer  "disease_id",   :default => 0
    t.integer  "stage_id",     :default => 0
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities_stages", :id => false, :force => true do |t|
    t.integer  "entity_id",    :default => 0
    t.integer  "stage_id",     :default => 0
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "story_id",            :default => 0, :null => false
    t.integer  "examination_type_id"
    t.integer  "location_id"
    t.text     "text"
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version",        :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_types", :id => false, :force => true do |t|
    t.integer "adverse_event_id"
    t.integer "adverse_event_type_id"
  end

  create_table "functions", :force => true do |t|
    t.string   "name_de",          :limit => 100, :default => "",    :null => false
    t.boolean  "multiple",                        :default => false, :null => false
    t.integer  "parameters_count",                :default => 0
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "guidelines", :force => true do |t|
    t.string   "name"
    t.string   "version",            :limit => 11
    t.text     "text"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guideline_state_id",               :default => 273
  end

  create_table "guidelines_results", :id => false, :force => true do |t|
    t.integer "guideline_id"
    t.integer "result_id"
  end

  create_table "help_categories", :force => true do |t|
    t.integer "role_id",    :default => 0
    t.string  "name"
    t.string  "model_name"
  end

  create_table "help_texts", :force => true do |t|
    t.integer  "help_category_id", :default => 0, :null => false
    t.integer  "role_id",          :default => 0
    t.string   "name"
    t.text     "text"
    t.integer  "version"
    t.integer  "lock_version",     :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", :force => true do |t|
    t.integer  "patient_id",                                            :default => 0,             :null => false
    t.integer  "kind",                                                  :default => 0,             :null => false
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
    t.integer  "lock_version",                                          :default => 0
    t.datetime "updated_at"
    t.integer  "date_kind"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "upn"
    t.string   "type",                                                  :default => "Examination"
    t.integer  "transplantation_type_id"
    t.integer  "examination_type_id",                                   :default => 100
    t.integer  "milestone_type_id"
    t.integer  "location_id"
    t.integer  "result_id"
    t.integer  "gvhd_id"
    t.integer  "cmv_id"
    t.integer  "side_id"
    t.integer  "coagulation_type_id"
    t.integer  "operation_type_id"
    t.integer  "chemotherapy_type_id"
    t.decimal  "weigth",                  :precision => 4, :scale => 1
    t.integer  "creatinine"
    t.integer  "reduction_type_id",                                     :default => 275
    t.integer  "disease_id"
    t.integer  "area_id"
    t.integer  "protocol_id"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "bilirubin"
    t.integer  "emetogenic_risk"
  end

  add_index "histories", ["patient_id"], :name => "index_histories_on_patient_id"

  create_table "incidents", :force => true do |t|
    t.text     "name"
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

  create_table "infections", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "lock_version", :default => 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infections_patients", :id => false, :force => true do |t|
    t.integer "infection_id"
    t.integer "patient_id"
  end

  create_table "items", :force => true do |t|
    t.integer  "parameter_id", :default => 0, :null => false
    t.integer  "protocol_id",  :default => 0, :null => false
    t.integer  "function_id",  :default => 0, :null => false
    t.integer  "lock_version", :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "items", ["parameter_id"], :name => "index_items_on_parameter_id"
  add_index "items", ["protocol_id"], :name => "index_items_on_protocol_id"

  create_table "levels", :force => true do |t|
    t.integer  "history_id"
    t.integer  "dose_id"
    t.integer  "reduction_type_id"
    t.integer  "position"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.decimal  "amount",            :precision => 7, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
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

  create_table "members", :force => true do |t|
    t.integer  "user_id",         :default => 0, :null => false
    t.integer  "conference_id",   :default => 0, :null => false
    t.integer  "moderation",      :default => 0, :null => false
    t.integer  "lock_version",    :default => 0
    t.datetime "updated_at"
    t.datetime "participated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "members", ["conference_id"], :name => "index_members_on_conference_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "objectives", :force => true do |t|
    t.integer  "patient_id",   :default => 0, :null => false
    t.date     "date"
    t.text     "text"
    t.text     "plan"
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objectives", ["patient_id"], :name => "index_objectives_on_patient_id"

  create_table "operation_types", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "description"
    t.integer  "has_sides"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.integer  "histories_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "version"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations_schedules", :id => false, :force => true do |t|
    t.integer "operation_id"
    t.integer "schedule_id"
  end

  create_table "orders", :force => true do |t|
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
    t.text     "comment"
    t.integer  "area_id"
    t.date     "next_date"
  end

  create_table "parameters", :force => true do |t|
    t.integer  "function_id",                 :default => 0,  :null => false
    t.integer  "user_id",                     :default => 0,  :null => false
    t.string   "name_de",      :limit => 100, :default => "", :null => false
    t.integer  "position",                    :default => 0,  :null => false
    t.integer  "lock_version",                :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "name"
    t.string   "name_en"
  end

  add_index "parameters", ["function_id"], :name => "index_parameters_on_function_id"

  create_table "participants", :force => true do |t|
    t.integer  "user_id",             :default => 0, :null => false
    t.integer  "protocol_id",         :default => 0, :null => false
    t.integer  "participant_type_id"
    t.integer  "lock_version",        :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "participants", ["protocol_id"], :name => "index_participants_on_protocol_id"
  add_index "participants", ["user_id"], :name => "index_participants_on_user_id"

  create_table "patients", :force => true do |t|
    t.string   "hospital_id",        :limit => 10, :default => "", :null => false
    t.string   "first_name"
    t.string   "name_addition"
    t.string   "last_name"
    t.integer  "disease_id",                       :default => 0
    t.integer  "lock_version",                     :default => 0
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
    t.integer  "has_no_hospital_id",               :default => 0
    t.integer  "height"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id"
    t.string   "controller"
    t.string   "action"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "physicians", :force => true do |t|
    t.integer  "patient_id",   :default => 0
    t.integer  "user_id",      :default => 0
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protocols", :force => true do |t|
    t.string   "name_de",           :limit => 80, :default => "", :null => false
    t.text     "description_de"
    t.string   "status",            :limit => 2,  :default => "", :null => false
    t.string   "id_study",          :limit => 20
    t.text     "rationale"
    t.text     "protocol"
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
    t.integer  "lock_version",                    :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "eudract"
    t.integer  "protocol_state_id",               :default => 57
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
    t.text     "description"
    t.text     "description_en"
    t.string   "substance"
    t.string   "substance_en"
  end

  create_table "protocols_stages", :id => false, :force => true do |t|
    t.integer  "protocol_id",  :default => 0
    t.integer  "stage_id",     :default => 0
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "story_id",     :default => 0, :null => false
    t.string   "name"
    t.text     "answer"
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.text     "text"
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

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "users_count", :default => 0, :null => false
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "area_id",      :default => 0,  :null => false
    t.integer  "number"
    t.integer  "beds"
    t.integer  "lock_version", :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "side_id",      :default => 16
  end

  create_table "screenings", :force => true do |t|
    t.integer  "protocol_id",       :default => 0
    t.integer  "patient_id",        :default => 0
    t.integer  "screening_type_id"
    t.date     "date"
    t.text     "text"
    t.integer  "version"
    t.integer  "lock_version",      :default => 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.integer  "disease_id",   :default => 0
    t.string   "name_de"
    t.integer  "position"
    t.integer  "version"
    t.integer  "lock_version", :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "name_en"
  end

  create_table "stages_topics", :id => false, :force => true do |t|
    t.integer "stage_id"
    t.integer "topic_id"
  end

  create_table "stories", :force => true do |t|
    t.integer  "disease_id",           :default => 0, :null => false
    t.string   "name"
    t.string   "text"
    t.text     "history"
    t.text     "physical_examination"
    t.integer  "version"
    t.integer  "lock_version",         :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "user_id",          :default => 0, :null => false
    t.integer  "patient_id",       :default => 0
    t.string   "text"
    t.integer  "priority_type_id"
    t.date     "due_date"
    t.date     "completed_date"
    t.integer  "version"
    t.integer  "lock_version",     :default => 0
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timepoints", :force => true do |t|
    t.integer  "disorder_id",       :default => 0
    t.integer  "timepoint_type_id"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "lock_version",      :default => 0
    t.integer  "version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timepoints", ["disorder_id"], :name => "index_timepoints_on_disorder_id"

  create_table "topics", :force => true do |t|
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

  create_table "transcripts", :force => true do |t|
    t.integer  "conference_id", :default => 0, :null => false
    t.date     "date"
    t.integer  "lock_version",  :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "transcripts", ["conference_id"], :name => "index_transcripts_on_conference_id"

  create_table "transcripts_users", :id => false, :force => true do |t|
    t.integer "transcript_id"
    t.integer "user_id"
  end

  create_table "trialists", :force => true do |t|
    t.integer  "patient_id",        :default => 0, :null => false
    t.integer  "protocol_id",       :default => 0, :null => false
    t.string   "id_study"
    t.date     "date_consent"
    t.integer  "lock_version",      :default => 0
    t.datetime "updated_at"
    t.integer  "version"
    t.datetime "created_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "trialist_type_id"
    t.integer  "user_id"
    t.text     "text"
    t.date     "date_registration"
    t.integer  "allocation_id"
    t.date     "date_screening"
    t.date     "date_conclusion"
  end

  add_index "trialists", ["patient_id"], :name => "index_trialists_on_patient_id"
  add_index "trialists", ["protocol_id"], :name => "index_trialists_on_protocol_id"

  create_table "users", :force => true do |t|
    t.integer  "role_id",                        :default => 0, :null => false
    t.string   "hashed_password",  :limit => 40
    t.string   "title",            :limit => 40
    t.string   "first_name",       :limit => 40
    t.string   "last_name",        :limit => 80
    t.string   "phone",            :limit => 20
    t.string   "fax",              :limit => 20
    t.string   "email",            :limit => 80
    t.integer  "lock_version",                   :default => 0
    t.datetime "updated_at"
    t.string   "pager"
    t.integer  "department_id",                  :default => 0, :null => false
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
