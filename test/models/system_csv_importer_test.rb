require "test_helper"

class SystemCsvImporterTest < ActiveSupport::TestCase
  test "passed a filename that does not exist raises an ArgumentError" do
    filename = Rails.root.join("test", "fixtures", "files", "this_does_not_exist.csv")
    assert_raises(ArgumentError) do
      SystemCsvImporter.new(filename: filename)
    end
  end

  test "#import given a file that contains no rows does nothing" do
    filename = Rails.root.join("test", "fixtures", "files", "empty.csv")
    importer = SystemCsvImporter.new(filename: filename)

    assert_no_difference("System.count") do
      importer.import
    end
  end

  test "#import given a file that contains a single valid row
        creates the system with correct data" do
    filename = Rails.root.join("test", "fixtures", "files", "one_valid.csv")
    importer = SystemCsvImporter.new(filename: filename)

    assert_difference("System.count", 1) do
      importer.import
    end

    system = System.last
    assert(system)

    assert_equal("Sol", system.name)
    assert_equal(0.000005, system.x)
    assert_equal(0.000000, system.y)
    assert_equal(0.000000, system.z)
    assert_nil(system.giliese_catalogue_name)
    assert_nil(system.bayer_flamsteed_designation)
    assert_equal("Sol", system.proper_name)
    assert_equal(4.85, system.absolute_magnitude)
    assert_equal("G2V", system.spectral_type)
    assert_equal(0.656, system.colour_index)
    assert_nil(system.constellation)
    assert_equal(1.0, system.luminosity)
  end

  test "#import given a file that contains multiple valid rows
        creates the systems" do
    filename = Rails.root.join("test", "fixtures", "files", "ten_valid.csv")
    importer = SystemCsvImporter.new(filename: filename)

    assert_difference("System.count", 10) do
      importer.import
    end
  end

  test "#import given a file that contains multiple valid rows
        creates a subset of the systems if passed the row_count argument" do
    row_count = 4
    filename = Rails.root.join("test", "fixtures", "files", "ten_valid.csv")
    importer = SystemCsvImporter.new(filename: filename, row_count: row_count)

    assert_difference("System.count", row_count) do
      importer.import
    end
  end

  test "#import assigns the correct name following the rules:
        - uses proper_name first
        - uses bayer_flamsteed_designation second
        - uses giliese_catalogue_name third
        - uses a random name fourth" do
    filename = Rails.root.join("test", "fixtures", "files", "different_names.csv")
    importer = SystemCsvImporter.new(filename: filename)

    assert_difference("System.count", 4) do
      importer.import
    end

    names = System.order(:created_at).map(&:name)

    assert_equal("Proper name", names[0])
    assert_equal("BayerFlamsteed designation", names[1])
    assert_equal("Giliese catalogue name", names[2])
    assert(names[3].present?)
    refute(names[3].empty?)
  end
end
