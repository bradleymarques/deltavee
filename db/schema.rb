# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_22_071321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planets", force: :cascade do |t|
    t.string "planet_name", null: false
    t.string "alternate_names"
    t.bigint "star_id"
    t.float "x", null: false
    t.float "y", null: false
    t.float "z", null: false
    t.string "star_name"
    t.float "ra", null: false
    t.float "dec", null: false
    t.float "mag_v"
    t.float "mag_i"
    t.float "mag_j"
    t.float "mag_h"
    t.float "mag_k"
    t.float "star_distance"
    t.float "star_distance_error_min"
    t.float "star_distance_error_max"
    t.float "star_metallicity"
    t.float "star_metallicity_error_min"
    t.float "star_metallicity_error_max"
    t.float "star_mass"
    t.float "star_mass_error_min"
    t.float "star_mass_error_max"
    t.float "star_radius"
    t.float "star_radius_error_min"
    t.float "star_radius_error_max"
    t.float "star_sp_type"
    t.float "star_age"
    t.float "star_age_error_min"
    t.float "star_age_error_max"
    t.float "star_teff"
    t.float "star_teff_error_min"
    t.float "star_teff_error_max"
    t.float "star_detected_disc"
    t.float "star_magnetic_field"
    t.string "star_alternate_names"
    t.integer "planet_status"
    t.integer "discovered"
    t.date "updated"
    t.string "publication"
    t.integer "detection_type"
    t.integer "mass_detection_type"
    t.integer "radius_detection_type"
    t.float "mass"
    t.float "mass_error_min"
    t.float "mass_error_max"
    t.float "mass_sini"
    t.float "mass_sini_error_min"
    t.float "mass_sini_error_max"
    t.float "radius"
    t.float "radius_error_min"
    t.float "radius_error_max"
    t.float "orbital_period"
    t.float "orbital_period_error_min"
    t.float "orbital_period_error_max"
    t.float "semi_major_axis"
    t.float "semi_major_axis_error_min"
    t.float "semi_major_axis_error_max"
    t.float "eccentricity"
    t.float "eccentricity_error_min"
    t.float "eccentricity_error_max"
    t.float "inclination"
    t.float "inclination_error_min"
    t.float "inclination_error_max"
    t.float "angular_distance"
    t.float "omega"
    t.float "omega_error_min"
    t.float "omega_error_max"
    t.float "tperi"
    t.float "tperi_error_min"
    t.float "tperi_error_max"
    t.float "tconj"
    t.float "tconj_error_min"
    t.float "tconj_error_max"
    t.float "tzero_tr"
    t.float "tzero_tr_error_min"
    t.float "tzero_tr_error_max"
    t.float "tzero_tr_sec"
    t.float "tzero_tr_sec_error_min"
    t.float "tzero_tr_sec_error_max"
    t.float "lambda_angle"
    t.float "lambda_angle_error_min"
    t.float "lambda_angle_error_max"
    t.float "impact_parameter"
    t.float "impact_parameter_error_min"
    t.float "impact_parameter_error_max"
    t.float "tzero_vr"
    t.float "tzero_vr_error_min"
    t.float "tzero_vr_error_max"
    t.float "k"
    t.float "k_error_min"
    t.float "k_error_max"
    t.float "temp_calculated"
    t.float "temp_calculated_error_min"
    t.float "temp_calculated_error_max"
    t.float "temp_measured"
    t.float "hot_point_lon"
    t.float "geometric_albedo"
    t.float "geometric_albedo_error_min"
    t.float "geometric_albedo_error_max"
    t.float "log_g"
    t.float "molecules"
    t.index ["star_id"], name: "index_planets_on_star_id"
  end

  create_table "stars", force: :cascade do |t|
    t.string "proper_name"
    t.integer "hyg_database_id"
    t.integer "hipparcos_catalog_id"
    t.integer "henry_draper_catalog_id"
    t.integer "harvard_revised_catalog_id"
    t.integer "gliese_catalog_id"
    t.string "bayer_flamsteed_designation"
    t.string "bayer_designation"
    t.string "flamsteed_designation"
    t.float "right_ascension", null: false
    t.float "declination", null: false
    t.float "distance_from_sol", null: false
    t.float "x", null: false
    t.float "y", null: false
    t.float "z", null: false
    t.float "velocity_x", null: false
    t.float "velocity_y", null: false
    t.float "velocity_z", null: false
    t.string "constellation"
    t.float "visual_magnitude", null: false
    t.float "absolute_magnitude", null: false
    t.string "spectral_type"
    t.float "color_index"
    t.float "luminosity"
    t.integer "temperature"
    t.integer "peak_wavelength"
    t.string "hex_color", null: false
    t.integer "red_color", null: false
    t.integer "green_color", null: false
    t.integer "blue_color", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "has_signed_in_at_least_once", default: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
