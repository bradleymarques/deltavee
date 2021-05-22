require "csv"

##
# Imports stars from a semi-colon delimited file
#
class StarCsvImporter
  def initialize(filename:, show_progress: false)
    @filename = filename
    @show_progress = show_progress

    check_file_exists
    count_number_lines
    setup_progress_bar if @show_progress
  end

  def import
    CSV.foreach(@filename, { col_sep: ";", headers: true }).with_index do |row, index|
      import_star(row)
      @progress_bar.increment if @show_progress
    end
  end

  private

  def import_star(row)
    star_data = row.to_h.except("star_id", "planet_count", "color_id")
    star = Star.new(star_data)
    star.id = row["star_id"]
    star.save!
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end

  def count_number_lines
    file = File.open(@filename)
    @number_lines = file.readlines.size
    file.close
  end

  def setup_progress_bar
    @progress_bar = ProgressBar.create(
      title: "Stars",
      starting_at: 0,
      total: @number_lines,
      progress_mark: "="
    )
  end
end
