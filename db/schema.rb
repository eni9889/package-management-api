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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150428190246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id",                     null: false
    t.string   "access_token",                null: false
    t.boolean  "active",       default: true, null: false
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "bundles", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bundles", ["name"], name: "index_bundles_on_name", using: :btree

  create_table "bundles_package_versions", id: false, force: :cascade do |t|
    t.uuid "bundle_id"
    t.uuid "version_id"
  end

  add_index "bundles_package_versions", ["bundle_id"], name: "index_bundles_package_versions_on_bundle_id", using: :btree
  add_index "bundles_package_versions", ["version_id"], name: "index_bundles_package_versions_on_version_id", using: :btree

  create_table "bundles_packages", id: false, force: :cascade do |t|
    t.uuid "bundle_id",  null: false
    t.uuid "package_id", null: false
  end

  add_index "bundles_packages", ["bundle_id", "package_id"], name: "index_bundles_packages_on_bundle_id_and_package_id", using: :btree
  add_index "bundles_packages", ["package_id", "bundle_id"], name: "index_bundles_packages_on_package_id_and_bundle_id", using: :btree

  create_table "categories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "text"
    t.uuid     "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "developer_identifiers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "developer_id"
    t.string   "identifier"
    t.string   "identifier_type"
    t.json     "download_stats"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "developer_identifiers", ["developer_id"], name: "index_developer_identifiers_on_developer_id", using: :btree
  add_index "developer_identifiers", ["identifier", "identifier_type"], name: "index_developer_identifiers_on_identifier_and_identifier_type", unique: true, using: :btree

  create_table "developers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.json     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "executables", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "executables", ["name"], name: "index_executables_on_name", using: :btree

  create_table "executables_package_versions", id: false, force: :cascade do |t|
    t.uuid "executable_id"
    t.uuid "version_id"
  end

  add_index "executables_package_versions", ["executable_id"], name: "index_executables_package_versions_on_executable_id", using: :btree
  add_index "executables_package_versions", ["version_id"], name: "index_executables_package_versions_on_version_id", using: :btree

  create_table "executables_packages", id: false, force: :cascade do |t|
    t.uuid "executable_id", null: false
    t.uuid "package_id",    null: false
  end

  add_index "executables_packages", ["executable_id", "package_id"], name: "index_executables_packages_on_executable_id_and_package_id", using: :btree
  add_index "executables_packages", ["package_id", "executable_id"], name: "index_executables_packages_on_package_id_and_executable_id", using: :btree

  create_table "featured_banners", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid   "target_id"
    t.string "target_type"
    t.string "image"
  end

  add_index "featured_banners", ["target_type", "target_id"], name: "index_featured_banners_on_target_type_and_target_id", using: :btree

  create_table "featured_collection_items", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "position"
    t.uuid     "collection_id"
    t.uuid     "set_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "featured_collection_items", ["collection_id", "position"], name: "index_featured_collection_items_on_collection_id_and_position", using: :btree
  add_index "featured_collection_items", ["set_id"], name: "index_featured_collection_items_on_set_id", using: :btree

  create_table "featured_collections", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.json     "settings"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "featured_feed_section_items", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "section_id",  null: false
    t.uuid     "target_id"
    t.string   "target_type"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "featured_feed_section_items", ["section_id"], name: "index_featured_feed_section_items_on_section_id", using: :btree
  add_index "featured_feed_section_items", ["target_type", "target_id"], name: "index_featured_feed_section_items_on_target_type_and_target_id", using: :btree

  create_table "featured_feed_sections", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "feed_id",      null: false
    t.integer  "position"
    t.string   "name"
    t.string   "section_type"
    t.uuid     "target_id"
    t.string   "target_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.json     "settings"
  end

  add_index "featured_feed_sections", ["feed_id"], name: "index_featured_feed_sections_on_feed_id", using: :btree
  add_index "featured_feed_sections", ["target_type", "target_id"], name: "index_featured_feed_sections_on_target_type_and_target_id", using: :btree

  create_table "featured_feeds", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "featured_set_items", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "set_id",     null: false
    t.uuid     "package_id", null: false
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "featured_set_items", ["package_id"], name: "index_featured_set_items_on_package_id", using: :btree
  add_index "featured_set_items", ["set_id", "position"], name: "index_featured_set_items_on_set_id_and_position", using: :btree

  create_table "featured_sets", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_authors", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "dev_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.uuid     "identifier_id"
  end

  add_index "package_authors", ["identifier_id"], name: "index_package_authors_on_identifier_id", using: :btree
  add_index "package_authors", ["name", "email", "dev_id"], name: "index_package_authors_on_name_and_email_and_dev_id", unique: true, using: :btree

  create_table "package_download_counts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "target_id"
    t.string   "target_type"
    t.datetime "created_at",              null: false
    t.integer  "count",       default: 0, null: false
  end

  add_index "package_download_counts", ["created_at"], name: "index_package_download_counts_on_created_at", using: :btree
  add_index "package_download_counts", ["target_type", "target_id"], name: "index_package_download_counts_on_target_type_and_target_id", using: :btree

  create_table "package_versions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "version",                              null: false
    t.string   "deb",                                  null: false
    t.integer  "downloads",                default: 0
    t.uuid     "package_id"
    t.datetime "date_uploaded"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "md5",           limit: 32
    t.text     "raw_text"
    t.json     "meta_data"
  end

  add_index "package_versions", ["package_id", "version"], name: "index_package_versions_on_package_id_and_version", unique: true, using: :btree

  create_table "packages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.integer  "downloads"
    t.string   "provider_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "commercial"
    t.boolean  "purchased"
    t.uuid     "developer_id",                         null: false
    t.text     "description"
    t.decimal  "price",        precision: 5, scale: 2
    t.json     "extra_info"
  end

  add_index "packages", ["downloads"], name: "index_packages_on_downloads", using: :btree

  create_table "ratings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "version_id"
    t.uuid     "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "ratings", ["version_id", "user_id"], name: "index_ratings_on_version_id_and_user_id", unique: true, using: :btree

  create_table "repositories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "deb_host"
    t.string   "homepage"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.json     "distributions"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
