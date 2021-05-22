require "test_helper"

class StarCsvImporterTest < ActiveSupport::TestCase
  test "passed a filename that does not exist raises an ArgumentError" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "stars", "this_does_not_exist.csv"
    )
    assert_raises(ArgumentError) do
      StarCsvImporter.new(filename: filename)
    end
  end

  test "#import given a file that contains no rows nor headings does nothing" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "stars", "empty.csv"
    )
    importer = StarCsvImporter.new(filename: filename)

    assert_no_difference("Star.count") do
      importer.import
    end
  end

  test "#import given a file that contains a single valid row creates the star
        with correct data" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "stars", "one_valid.csv"
    )
    importer = StarCsvImporter.new(filename: filename)

    assert_difference("Star.count", 1) do
      importer.import
    end

    star = Star.last
    assert(star)

    assert_equal(1, star.id, "id")
    assert_equal("Sol", star.proper_name, "proper_name")
    assert_equal(0, star.hyg_database_id, "hyg_database_id")
    assert_nil(star.hipparcos_catalog_id, "hipparcos_catalog_id")
    assert_nil(star.henry_draper_catalog_id, "henry_draper_catalog_id")
    assert_nil(star.harvard_revised_catalog_id, "harvard_revised_catalog_id")
    assert_nil(star.gliese_catalog_id, "gliese_catalog_id")
    assert_nil(star.bayer_flamsteed_designation, "bayer_flamsteed_designation")
    assert_nil(star.bayer_designation, "bayer_designation")
    assert_nil(star.flamsteed_designation, "flamsteed_designation")
    assert_equal(0.0, star.right_ascension, "right_ascension")
    assert_equal(0.0, star.declination, "declination")
    assert_equal(0.0, star.distance_from_sol, "distance_from_sol")
    assert_equal(0.000005, star.x, "x")
    assert_equal(0.0, star.y, "y")
    assert_equal(0.0, star.z, "z")
    assert_equal(0.0, star.velocity_x, "velocity_x")
    assert_equal(0.0, star.velocity_y, "velocity_y")
    assert_equal(0.0, star.velocity_z, "velocity_z")
    assert_nil(star.constellation, "constellation")
    assert_equal(-26.7, star.visual_magnitude, "visual_magnitude")
    assert_equal(4.85, star.absolute_magnitude, "absolute_magnitude")
    assert_equal("G2V", star.spectral_type, "spectral_type")
    assert_equal(0.656, star.color_index, "color_index")
    assert_equal(1.0, star.luminosity, "luminosity")
    assert_equal(5756, star.temperature, "temperature")
    assert_equal(503, star.peak_wavelength, "peak_wavelength")
    assert_equal("#fff1e5", star.hex_color, "hex_color")
    assert_equal(255, star.red_color, "red_color")
    assert_equal(241, star.green_color, "green_color")
    assert_equal(229, star.blue_color, "blue_color")
  end

  test "#import given a file that contains multiple valid rows creates the stars" do
    filename = Rails.root.join(
      "test", "fixtures", "files", "stars", "five_valid.csv"
    )
    importer = StarCsvImporter.new(filename: filename)

    assert_difference("Star.count", 5) do
      importer.import
    end
  end
end
