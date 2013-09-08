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

ActiveRecord::Schema.define(version: 20130906165015) do

  create_table "town_health_records", force: true do |t|
    t.string   "location"
    t.integer  "population_05"
    t.integer  "population_05_under_20"
    t.integer  "population_05_over_64"
    t.integer  "per_capita_income_00"
    t.integer  "total_population_00_below_200_perc_poverty"
    t.float    "population_00_perc_below_200_perc_poverty"
    t.float    "adequate_prenatal_care_perc"
    t.float    "c_section_perc_05_to_08"
    t.integer  "infant_deaths_05_to_08"
    t.float    "infant_mortality_perc_05_to_08"
    t.float    "low_birth_perc_05_to_08"
    t.float    "multiple_birth_perc_05_to_08"
    t.float    "public_prenatal_perc"
    t.float    "teen_birth_perc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
