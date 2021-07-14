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

ActiveRecord::Schema.define(version: 2021_07_14_054718) do

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patients_id"
    t.date "date"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patients_id"], name: "index_appointments_on_patients_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "speciality"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "password"
  end

end
