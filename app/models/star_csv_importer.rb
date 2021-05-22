require "csv"

##
# Imports stars from a CSV (semi-colon delimited) file
#
class StarCsvImporter
  ALL = :all

  def initialize(filename:, row_count: ALL, show_progress: false)
    @filename = filename
    @show_progress = show_progress
    @row_count = row_count
    check_file_exists
  end

  def import
    puts("Importing stars from #{@filename}") if @show_progress

    CSV.foreach(@filename, { col_sep: ";", headers: true }).with_index do |row, index|
      break if (@row_count != ALL) && (index >= @row_count)

      print("*") if @show_progress
      import_star(row)
    end

    puts(" Done!") if @show_progress
  end

  private

  def import_star(row)
    star = Star.new(
      id: row["star_id"],
      proper_name: row["proper_name"],
      hyg_database_id: row["hyg_database_id"],
      hipparcos_catalog_id: row["hipparcos_catalog_id"],
      henry_draper_catalog_id: row["henry_draper_catalog_id"],
      harvard_revised_catalog_id: row["harvard_revised_catalog_id"],
      gliese_catalog_id: row["gliese_catalog_id"],
      bayer_flamsteed_designation: row["bayer_flamsteed_designation"],
      bayer_designation: row["bayer"],
      flamsteed_designation: row["flam"],
      right_ascension: row["right_ascension"],
      declination: row["declination"],
      distance_from_sol: row["distance_from_sol"],
      x: row["x"],
      y: row["y"],
      z: row["z"],
      velocity_x: row["vx"],
      velocity_y: row["vy"],
      velocity_z: row["vz"],
      constellation: row["con"],
      visual_magnitude: row["visual_magnitude"],
      absolute_magnitude: row["absolute_magnitude"],
      spectral_type: row["spectral_type"],
      color_index: row["color_index"],
      luminosity: row["luminosity"],
      temperature: row["temperature"],
      peak_wavelength: row["peak_wavelength"],
      hex_color: row["hex_color"],
      red_color: row["red_color"],
      green_color: row["green_color"],
      blue_color: row["blue_color"]
    )

    if star.valid?
      star.save!
    else
      id = row["star_id"]
      puts "Could not import Star with id: #{id}!" if @show_progress
    end
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end
end
