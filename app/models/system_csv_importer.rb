require "csv"

##
# Imports systems from a CSV (semi-colon delimited) file
#
class SystemCsvImporter
  def initialize(filename:)
    @filename = filename
    check_file_exists
  end

  def import
    CSV.foreach(@filename, { col_sep: ";", headers: true }) do |row|
      import_system(row)
    end
  end

  private

  def import_system(row)
    system = System.new(
      name: fetch_system_name(row),
      x_parsecs: row["x_parsecs"],
      y_parsecs: row["y_parsecs"],
      z_parsecs: row["z_parsecs"],
      giliese_catalogue_name: row["giliese_catalogue_name"],
      bayer_flamsteed_designation: row["bayer_flamsteed_designation"],
      proper_name: row["proper_name"],
      absolute_magnitude: row["absolute_magnitude"],
      spectral_type: row["spectral_type"],
      colour_index: row["colour_index"],
      constellation: row["constellation"],
      luminosity: row["luminosity"]
    )

    if system.valid?
      system.save!
    else
      puts "Error in importing row: #{row}"
    end
  end

  def fetch_system_name(row)
    row["proper_name"] ||
      row["bayer_flamsteed_designation"] ||
      row["giliese_catalogue_name"] ||
      random_system_name
  end

  def random_system_name
    SystemNameGenerator.new.generate
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end
end
