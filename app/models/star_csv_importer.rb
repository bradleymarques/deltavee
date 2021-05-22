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
      import_star(row)
    end

    puts(" Done!") if @show_progress
  end

  private

  def import_star(row)
    star_data = row.to_h.except("star_id", "planet_count", "color_id")
    star = Star.new(star_data)
    star.id = row["star_id"]

    if star.valid?
      print("⭐️") if @show_progress
      star.save!
    elsif @show_progress
      print("❌") if @show_progress
      puts(star.errors.full_messages.to_sentence)
    end
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end
end
