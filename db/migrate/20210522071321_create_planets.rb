class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      # Names
      t.string :planet_name, null: false
      t.string :alternate_names, null: true

      # Star id, if any:
      t.references :star, index: true, null: true

      # Other star-related data
      t.float :x, null: false
      t.float :y, null: false
      t.float :z, null: false
      t.string :star_name, null: true
      t.float :ra, null: false
      t.float :dec, null: false
      t.float :mag_v, null: true
      t.float :mag_i, null: true
      t.float :mag_j, null: true
      t.float :mag_h, null: true
      t.float :mag_k, null: true
      t.float :star_distance, null: true
      t.float :star_distance_error_min, null: true
      t.float :star_distance_error_max, null: true
      t.float :star_metallicity, null: true
      t.float :star_metallicity_error_min, null: true
      t.float :star_metallicity_error_max, null: true
      t.float :star_mass, null: true
      t.float :star_mass_error_min, null: true
      t.float :star_mass_error_max, null: true
      t.float :star_radius, null: true
      t.float :star_radius_error_min, null: true
      t.float :star_radius_error_max, null: true
      t.float :star_sp_type, null: true
      t.float :star_age, null: true
      t.float :star_age_error_min, null: true
      t.float :star_age_error_max, null: true
      t.float :star_teff, null: true
      t.float :star_teff_error_min, null: true
      t.float :star_teff_error_max, null: true
      t.float :star_detected_disc, null: true
      t.float :star_magnetic_field, null: true
      t.string :star_alternate_names, null: true

      # Discovery
      t.integer :planet_status, null: true
      t.integer :discovered, null: true
      t.date :updated, null: true
      t.string :publication, null: true
      t.integer :detection_type, null: true
      t.integer :mass_detection_type, null: true
      t.integer :radius_detection_type, null: true

      # Vital Statistics
      t.float :mass, null: true
      t.float :mass_error_min, null: true
      t.float :mass_error_max, null: true
      t.float :mass_sini, null: true
      t.float :mass_sini_error_min, null: true
      t.float :mass_sini_error_max, null: true
      t.float :radius, null: true
      t.float :radius_error_min, null: true
      t.float :radius_error_max, null: true
      t.float :orbital_period, null: true
      t.float :orbital_period_error_min, null: true
      t.float :orbital_period_error_max, null: true
      t.float :semi_major_axis, null: true
      t.float :semi_major_axis_error_min, null: true
      t.float :semi_major_axis_error_max, null: true
      t.float :eccentricity, null: true
      t.float :eccentricity_error_min, null: true
      t.float :eccentricity_error_max, null: true
      t.float :inclination, null: true
      t.float :inclination_error_min, null: true
      t.float :inclination_error_max, null: true
      t.float :angular_distance, null: true
      t.float :omega, null: true
      t.float :omega_error_min, null: true
      t.float :omega_error_max, null: true
      t.float :tperi, null: true
      t.float :tperi_error_min, null: true
      t.float :tperi_error_max, null: true
      t.float :tconj, null: true
      t.float :tconj_error_min, null: true
      t.float :tconj_error_max, null: true
      t.float :tzero_tr, null: true
      t.float :tzero_tr_error_min, null: true
      t.float :tzero_tr_error_max, null: true
      t.float :tzero_tr_sec, null: true
      t.float :tzero_tr_sec_error_min, null: true
      t.float :tzero_tr_sec_error_max, null: true
      t.float :lambda_angle, null: true
      t.float :lambda_angle_error_min, null: true
      t.float :lambda_angle_error_max, null: true
      t.float :impact_parameter, null: true
      t.float :impact_parameter_error_min, null: true
      t.float :impact_parameter_error_max, null: true
      t.float :tzero_vr, null: true
      t.float :tzero_vr_error_min, null: true
      t.float :tzero_vr_error_max, null: true
      t.float :k, null: true
      t.float :k_error_min, null: true
      t.float :k_error_max, null: true
      t.float :temp_calculated, null: true
      t.float :temp_calculated_error_min, null: true
      t.float :temp_calculated_error_max, null: true
      t.float :temp_measured, null: true
      t.float :hot_point_lon, null: true
      t.float :geometric_albedo, null: true
      t.float :geometric_albedo_error_min, null: true
      t.float :geometric_albedo_error_max, null: true
      t.float :log_g, null: true
      t.float :molecules, null: true
    end
  end
end
