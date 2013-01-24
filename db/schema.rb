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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130111190953) do

  create_table "RLusers", :force => true do |t|
    t.string  "username",  :limit => 30,                :null => false
    t.string  "firstname", :limit => 30,                :null => false
    t.string  "lastname",  :limit => 30,                :null => false
    t.integer "admintype",               :default => 2, :null => false
    t.string  "password",  :limit => 30,                :null => false
  end

  create_table "ResourceSubjects", :primary_key => "ResourceSubjectID", :force => true do |t|
    t.integer "ResourceID",                       :null => false
    t.integer "SubjectID",                        :null => false
    t.string  "TopResourceScope",    :limit => 8
    t.string  "OtherResourceList",   :limit => 1
    t.string  "ResourceSubjectDesc"
  end

  create_table "ResourceSubjectsTest", :primary_key => "ResourceSubjectID", :force => true do |t|
    t.integer "ResourceID",                       :null => false
    t.integer "SubjectID",                        :null => false
    t.string  "TopResourceScope",    :limit => 8
    t.string  "OtherResourceList",   :limit => 1
    t.string  "ResourceSubjectDesc"
  end

  create_table "ResourceTypes", :primary_key => "ResourceTypeID", :force => true do |t|
    t.integer "ResourceID",                   :null => false
    t.integer "SubjectID",                    :null => false
    t.integer "TypeID",                       :null => false
    t.string  "PrimaryResource", :limit => 1
    t.string  "TypeAssigned",    :limit => 1, :null => false
  end

  create_table "ResourceTypesTest", :primary_key => "ResourceTypeID", :force => true do |t|
    t.integer "ResourceID",                   :null => false
    t.integer "SubjectID",                    :null => false
    t.integer "TypeID",                       :null => false
    t.string  "PrimaryResource", :limit => 1
  end

  create_table "ResourceUpdates", :primary_key => "ResourceUpdatesID", :force => true do |t|
    t.string "door_id",            :limit => 10
    t.string "new_until"
    t.string "cookie"
    t.string "physical_access"
    t.string "online_access"
    t.string "simultaneous_users"
    t.string "name"
    t.string "sort_name"
    t.string "parenthetical"
    t.string "mouseover"
    t.string "url"
    t.string "remote_url"
    t.string "remote_note"
    t.string "branding_logo"
    t.string "branding_note"
    t.string "coverage"
    t.string "title_list_url"
    t.string "language"
    t.string "access_note"
    t.string "frequency"
    t.string "see_also"
    t.string "description",        :limit => 4000
    t.string "short_desc"
    t.string "vendor_code"
    t.string "vendor_userid"
    t.string "vendor_password"
    t.string "stats_code"
    t.string "note",               :limit => 1000
    t.string "Production",         :limit => 1
    t.string "IsNew",              :limit => 1
    t.string "vendor_desc"
    t.string "PhysicalAccessType", :limit => 2
    t.string "AccessType",         :limit => 1
    t.string "LogoType",           :limit => 1
    t.string "PublicURL"
    t.date   "upd"
    t.string "UpdateStatus",       :limit => 6,    :default => "New", :null => false
    t.string "Processed",          :limit => 1,    :default => "N",   :null => false
  end

  create_table "Resources", :primary_key => "ResourceID", :force => true do |t|
    t.string "door_id",            :limit => 10
    t.string "new_until"
    t.string "cookie"
    t.string "physical_access"
    t.string "online_access"
    t.string "simultaneous_users"
    t.string "name"
    t.string "sort_name"
    t.string "parenthetical"
    t.string "mouseover"
    t.string "url"
    t.string "remote_url"
    t.string "remote_note"
    t.string "branding_logo"
    t.string "branding_note"
    t.string "coverage"
    t.string "title_list_url"
    t.string "language"
    t.string "access_note"
    t.string "frequency"
    t.string "see_also"
    t.string "description",        :limit => 4000
    t.string "short_desc"
    t.string "vendor_code"
    t.string "vendor_userid"
    t.string "vendor_password"
    t.string "stats_code"
    t.string "note",               :limit => 1000
    t.string "Production",         :limit => 1
    t.string "IsNew",              :limit => 1
    t.string "vendor_desc"
    t.string "PhysicalAccessType", :limit => 2
    t.string "AccessType",         :limit => 1
    t.string "LogoType",           :limit => 1
    t.string "PublicURL"
    t.string "call_number"
    t.string "endnote"
  end

  create_table "ResourcesTest", :primary_key => "ResourceID", :force => true do |t|
    t.string "door_id",            :limit => 10
    t.string "new_until"
    t.string "cookie"
    t.string "physical_access"
    t.string "online_access"
    t.string "simultaneous_users"
    t.string "name"
    t.string "sort_name"
    t.string "parenthetical"
    t.string "mouseover"
    t.string "url"
    t.string "remote_url"
    t.string "remote_note"
    t.string "branding_logo"
    t.string "branding_note"
    t.string "coverage"
    t.string "title_list_url"
    t.string "language"
    t.string "access_note"
    t.string "frequency"
    t.string "see_also"
    t.string "description",        :limit => 4000
    t.string "short_desc"
    t.string "vendor_code"
    t.string "vendor_userid"
    t.string "vendor_password"
    t.string "stats_code"
    t.string "note",               :limit => 1000
    t.string "Production",         :limit => 1
    t.string "IsNew",              :limit => 1
    t.string "vendor_desc"
    t.string "PhysicalAccessType", :limit => 2
    t.string "AccessType",         :limit => 1
    t.string "LogoType",           :limit => 1
    t.string "PublicURL"
    t.string "call_number"
  end

  create_table "SubjectTypes", :primary_key => "SubjectTypeID", :force => true do |t|
    t.integer "SubjectID",                    :null => false
    t.integer "TypeID",                       :null => false
    t.string  "SubjectSelected", :limit => 1
  end

  create_table "Subjects", :primary_key => "SubjectID", :force => true do |t|
    t.string "SubjectName",   :limit => 30
    t.string "TipDesc_1"
    t.string "tipURL_1",      :limit => 90
    t.string "TipDesc_2"
    t.string "tipURL_2",      :limit => 90
    t.string "TipDesc_3"
    t.string "tipURL_3",      :limit => 90
    t.string "TipDesc_4"
    t.string "tipURL_4",      :limit => 90
    t.string "TipDesc_5"
    t.string "tipURL_5",      :limit => 90
    t.string "TipDesc_6"
    t.string "tipURL_6",      :limit => 90
    t.string "CGuideDesc_1",  :limit => 90
    t.string "CGuideURL_1",   :limit => 90
    t.string "CGuideDesc_2",  :limit => 90
    t.string "CGuideURL_2",   :limit => 90
    t.string "CGuideDesc_3",  :limit => 90
    t.string "CGuideURL_3",   :limit => 90
    t.string "CGuideDesc_4",  :limit => 90
    t.string "CGuideURL_4",   :limit => 90
    t.string "CGuideDesc_5",  :limit => 90
    t.string "CGuideURL_5",   :limit => 90
    t.string "CGuideDesc_6",  :limit => 90
    t.string "CGuideURL_6",   :limit => 90
    t.string "CGuideDesc_7",  :limit => 90
    t.string "CGuideURL_7",   :limit => 90
    t.string "CGuideDesc_8",  :limit => 90
    t.string "CGuideURL_8",   :limit => 90
    t.string "CGuideDesc_9",  :limit => 90
    t.string "CGuideURL_9",   :limit => 90
    t.string "CGuideDesc_10", :limit => 90
    t.string "CGuideURL_10",  :limit => 90
  end

  create_table "TempUpdates", :primary_key => "TempUpdatesID", :force => true do |t|
    t.string "door_id",            :limit => 10
    t.string "new_until"
    t.string "cookie"
    t.string "physical_access"
    t.string "online_access"
    t.string "simultaneous_users"
    t.string "name"
    t.string "sort_name"
    t.string "parenthetical"
    t.string "mouseover"
    t.string "url"
    t.string "remote_url"
    t.string "remote_note"
    t.string "branding_logo"
    t.string "branding_note"
    t.string "coverage"
    t.string "title_list_url"
    t.string "language"
    t.string "access_note"
    t.string "frequency"
    t.string "see_also"
    t.string "description",        :limit => 4000
    t.string "short_desc"
    t.string "vendor_code"
    t.string "vendor_userid"
    t.string "vendor_password"
    t.string "stats_code"
    t.string "note",               :limit => 1000
    t.string "Production",         :limit => 1
    t.string "IsNew",              :limit => 1
    t.string "vendor_desc"
    t.string "PhysicalAccessType", :limit => 2
    t.string "AccessType",         :limit => 1
    t.string "LogoType",           :limit => 1
    t.string "PublicURL"
    t.date   "upd"
    t.string "UpdateStatus",       :limit => 6,    :default => "New", :null => false
  end

  create_table "Types", :primary_key => "TypeID", :force => true do |t|
    t.string "TypeName", :limit => 45
  end

  create_table "auth_group", :force => true do |t|
    t.string "name", :limit => 80, :null => false
  end

  add_index "auth_group", ["name"], :name => "name", :unique => true

  create_table "auth_group_permissions", :force => true do |t|
    t.integer "group_id",      :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], :name => "group_id", :unique => true
  add_index "auth_group_permissions", ["group_id"], :name => "auth_group_permissions_425ae3c4"
  add_index "auth_group_permissions", ["permission_id"], :name => "auth_group_permissions_1e014c8f"

  create_table "auth_message", :force => true do |t|
    t.integer "user_id",                       :null => false
    t.text    "message", :limit => 2147483647, :null => false
  end

  add_index "auth_message", ["user_id"], :name => "auth_message_403f60f"

  create_table "auth_permission", :force => true do |t|
    t.string  "name",            :limit => 50,  :null => false
    t.integer "content_type_id",                :null => false
    t.string  "codename",        :limit => 100, :null => false
  end

  add_index "auth_permission", ["content_type_id", "codename"], :name => "content_type_id", :unique => true
  add_index "auth_permission", ["content_type_id"], :name => "auth_permission_1bb8f392"

  create_table "auth_user", :force => true do |t|
    t.string   "username",     :limit => 30,  :null => false
    t.string   "first_name",   :limit => 30,  :null => false
    t.string   "last_name",    :limit => 30,  :null => false
    t.string   "email",        :limit => 75,  :null => false
    t.string   "password",     :limit => 128, :null => false
    t.boolean  "is_staff",                    :null => false
    t.boolean  "is_active",                   :null => false
    t.boolean  "is_superuser",                :null => false
    t.datetime "last_login",                  :null => false
    t.datetime "date_joined",                 :null => false
  end

  add_index "auth_user", ["username"], :name => "username", :unique => true

  create_table "auth_user_groups", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  add_index "auth_user_groups", ["group_id"], :name => "auth_user_groups_425ae3c4"
  add_index "auth_user_groups", ["user_id", "group_id"], :name => "user_id", :unique => true
  add_index "auth_user_groups", ["user_id"], :name => "auth_user_groups_403f60f"

  create_table "auth_user_user_permissions", :force => true do |t|
    t.integer "user_id",       :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_user_user_permissions", ["permission_id"], :name => "auth_user_user_permissions_1e014c8f"
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], :name => "user_id", :unique => true
  add_index "auth_user_user_permissions", ["user_id"], :name => "auth_user_user_permissions_403f60f"

  create_table "django_admin_log", :force => true do |t|
    t.datetime "action_time",                           :null => false
    t.integer  "user_id",                               :null => false
    t.integer  "content_type_id"
    t.text     "object_id",       :limit => 2147483647
    t.string   "object_repr",     :limit => 200,        :null => false
    t.integer  "action_flag",     :limit => 2,          :null => false
    t.text     "change_message",  :limit => 2147483647, :null => false
  end

  add_index "django_admin_log", ["content_type_id"], :name => "django_admin_log_1bb8f392"
  add_index "django_admin_log", ["user_id"], :name => "django_admin_log_403f60f"

  create_table "django_content_type", :force => true do |t|
    t.string "name",      :limit => 100, :null => false
    t.string "app_label", :limit => 100, :null => false
    t.string "model",     :limit => 100, :null => false
  end

  add_index "django_content_type", ["app_label", "model"], :name => "app_label", :unique => true

  create_table "django_session", :primary_key => "session_key", :force => true do |t|
    t.text     "session_data", :limit => 2147483647, :null => false
    t.datetime "expire_date",                        :null => false
  end

  create_table "django_site", :force => true do |t|
    t.string "domain", :limit => 100, :null => false
    t.string "name",   :limit => 50,  :null => false
  end

  create_table "popular_dbs", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
