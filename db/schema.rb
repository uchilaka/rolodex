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

ActiveRecord::Schema[8.0].define(version: 2025_07_02_121107) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "regions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "display_name"
    t.string "alpha2_code_iso3166", null: false
    t.string "numeric_code_iso3166"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha2_code_iso3166"], name: "index_regions_on_alpha2_code_iso3166", unique: true
    t.index ["name"], name: "index_regions_on_name", unique: true
  end
end
