require "csv"

##
# Imports systems from a CSV (semi-colon delimited) file
#
class SystemCsvImporter
  ALL = :all

  def initialize(filename:, row_count: ALL, show_progress: false)
    @filename = filename
    @show_progress = show_progress
    @row_count = row_count
    check_file_exists
  end

  def import
    puts("Importing systems from #{@filename}") if @show_progress

    CSV.foreach(@filename, { col_sep: ";", headers: true }).with_index do |row, index|
      break if (@row_count != ALL) && (index >= @row_count)

      print("*") if @show_progress
      import_system(row)
    end

    puts(" Done!") if @show_progress
  end

  private

  def import_system(row)
    system = System.new(
      name: fetch_system_name(row),
      x: row["x"],
      y: row["y"],
      z: row["z"],
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
      puts "Error in importing row: #{row}. Errors: #{system.errors.full_messages.to_sentence}"
    end
  end

  def fetch_system_name(row)
    row["proper_name"] ||
      row["bayer_flamsteed_designation"] ||
      row["giliese_catalogue_name"] ||
      random_system_name
  end

  def random_system_name
    NameGenerators::SystemNameGenerator.new.generate
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end
end
