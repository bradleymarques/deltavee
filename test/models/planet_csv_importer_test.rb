require "test_helper"

class PlanetCsvImporterTest < ActiveSupport::TestCase
  setup do
    @star = FactoryBot.create(:star, id: 28205) # Com 11
  end

  test "passed a filename that does not exist raises an ArgumentError" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "planets", "this_does_not_exist.csv"
    )
    assert_raises(ArgumentError) do
      PlanetCsvImporter.new(filename: filename)
    end
  end

  test "#import given a file that contains no rows nor headings does nothing" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "planets", "empty.csv"
    )
    importer = PlanetCsvImporter.new(filename: filename)

    assert_no_difference("Planet.count") do
      importer.import
    end
  end

  test "#import given a file that contains a single valid row creates the Planet
        with correct data" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "planets", "one_valid.csv"
    )
    importer = PlanetCsvImporter.new(filename: filename)

    assert_difference("Planet.count", 1) do
      importer.import
    end

    planet = Planet.last
    assert(planet)

    assert_equal("11 Com b", planet.planet_name)
    assert_nil(planet.alternate_names)
    assert_equal(@star, planet.star)
    assert_equal(-104.879822273928, planet.x)
    assert_equal(-9.50636164704847, planet.y)
    assert_equal(33.7966265775854, planet.z)
    assert_equal("11 Com", planet.star_name)
    assert_equal(185.1791667, planet.ra)
    assert_equal(17.7927778, planet.dec)
    assert_equal(4.74, planet.mag_v)
    assert_nil(planet.mag_i)
    assert_nil(planet.mag_j)
    assert_nil(planet.mag_h)
    assert_nil(planet.mag_k)
    assert_equal(110.6, planet.star_distance)
    assert_equal(10.5, planet.star_distance_error_min)
    assert_equal(10.5, planet.star_distance_error_max)
    assert_equal(-0.35, planet.star_metallicity)
    assert_equal(0.09, planet.star_metallicity_error_min)
    assert_equal(0.09, planet.star_metallicity_error_max)
    assert_equal(2.7, planet.star_mass)
    assert_equal(0.3, planet.star_mass_error_min)
    assert_equal(0.3, planet.star_mass_error_max)
    assert_equal(19.0, planet.star_radius)
    assert_equal(2.0, planet.star_radius_error_min)
    assert_equal(2.0, planet.star_radius_error_max)
    assert_equal(0.0, planet.star_sp_type)
    assert_nil(planet.star_age)
    assert_nil(planet.star_age_error_min)
    assert_nil(planet.star_age_error_max)
    assert_equal(4742.0, planet.star_teff)
    assert_equal(100.0, planet.star_teff_error_min)
    assert_equal(100.0, planet.star_teff_error_max)
    assert_nil(planet.star_detected_disc)
    assert_nil(planet.star_magnetic_field)
    assert_nil(planet.star_alternate_names)
    assert_equal("confirmed", planet.planet_status)
    assert_equal(2008, planet.discovered)
    assert_equal(Date.parse("Fri, 21 Aug 2015"), planet.updated)
    assert_equal("Published in a refereed paper", planet.publication)
    assert_equal("radial_velocity", planet.detection_type)
    assert_nil(planet.mass_detection_type)
    assert_nil(planet.radius_detection_type)
    assert_nil(planet.mass)
    assert_nil(planet.mass_error_min)
    assert_nil(planet.mass_error_max)
    assert_equal(19.4, planet.mass_sini)
    assert_equal(1.5, planet.mass_sini_error_min)
    assert_equal(1.5, planet.mass_sini_error_max)
    assert_nil(planet.radius)
    assert_nil(planet.radius_error_min)
    assert_nil(planet.radius_error_max)
    assert_equal(326.03, planet.orbital_period)
    assert_equal(0.32, planet.orbital_period_error_min)
    assert_equal(0.32, planet.orbital_period_error_max)
    assert_equal(1.29, planet.semi_major_axis)
    assert_equal(0.05, planet.semi_major_axis_error_min)
    assert_equal(0.05, planet.semi_major_axis_error_max)
    assert_equal(0.231, planet.eccentricity)
    assert_equal(0.005, planet.eccentricity_error_min)
    assert_equal(0.005, planet.eccentricity_error_max)
    assert_nil(planet.inclination)
    assert_nil(planet.inclination_error_min)
    assert_nil(planet.inclination_error_max)
    assert_equal(0.011664, planet.angular_distance)
    assert_equal(94.8, planet.omega)
    assert_equal(1.5, planet.omega_error_min)
    assert_equal(1.5, planet.omega_error_max)
    assert_equal(2452899.6, planet.tperi)
    assert_equal(1.6, planet.tperi_error_min)
    assert_equal(1.6, planet.tperi_error_max)
    assert_nil(planet.tconj)
    assert_nil(planet.tconj_error_min)
    assert_nil(planet.tconj_error_max)
    assert_nil(planet.tzero_tr)
    assert_nil(planet.tzero_tr_error_min)
    assert_nil(planet.tzero_tr_error_max)
    assert_nil(planet.tzero_tr_sec)
    assert_nil(planet.tzero_tr_sec_error_min)
    assert_nil(planet.tzero_tr_sec_error_max)
    assert_nil(planet.lambda_angle)
    assert_nil(planet.lambda_angle_error_min)
    assert_nil(planet.lambda_angle_error_max)
    assert_nil(planet.impact_parameter)
    assert_nil(planet.impact_parameter_error_min)
    assert_nil(planet.impact_parameter_error_max)
    assert_nil(planet.tzero_vr)
    assert_nil(planet.tzero_vr_error_min)
    assert_nil(planet.tzero_vr_error_max)
    assert_equal(296.7, planet.k)
    assert_equal(5.6, planet.k_error_min)
    assert_equal(5.6, planet.k_error_max)
    assert_nil(planet.temp_calculated)
    assert_nil(planet.temp_calculated_error_min)
    assert_nil(planet.temp_calculated_error_max)
    assert_nil(planet.temp_measured)
    assert_nil(planet.hot_point_lon)
    assert_nil(planet.geometric_albedo)
    assert_nil(planet.geometric_albedo_error_min)
    assert_nil(planet.geometric_albedo_error_max)
    assert_nil(planet.log_g)
    assert_nil(planet.molecules)
  end

  test "#import given a file that contains multiple valid rows creates the Planets" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "planets", "five_valid.csv"
    )
    importer = PlanetCsvImporter.new(filename: filename)

    assert_difference("Planet.count", 5) do
      importer.import
    end
  end
end
