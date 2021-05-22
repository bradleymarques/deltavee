require "csv"

class PlanetCsvImporter
  def initialize(filename:, show_progress: false)
    @filename = filename
    @show_progress = show_progress

    check_file_exists
    count_number_lines
    setup_progress_bar if @show_progress
  end

  def import
    CSV.foreach(@filename, { col_sep: ";", headers: true }).with_index do |row, index|
      import_planet(row)
      @progress_bar.increment if @show_progress
    end
  end

  def import_planet(row)
    planet_data = extract_planet_data(row)
    planet = Planet.new(planet_data)
    planet.save!
  end

  private

  def extract_planet_data(row)
    planet_data = row.to_h.except("planet_id", "distance_to_host_star")

    planet_data["id"] = row["planet_id"]

    planet_data["planet_status"] = snake_case(planet_data["planet_status"])
    planet_data["detection_type"] = snake_case(planet_data["detection_type"])
    planet_data["mass_detection_type"] = snake_case(planet_data["mass_detection_type"])
    planet_data["radius_detection_type"] = snake_case(planet_data["radius_detection_type"])

    planet_data
  end

  def check_file_exists
    raise ArgumentError unless FileTest.exist?(@filename)
  end

  def snake_case(string)
    return if string.nil?

    string.strip.underscore.gsub(" ", "_")
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
      progress_mark: "🪐"
    )
  end
end
