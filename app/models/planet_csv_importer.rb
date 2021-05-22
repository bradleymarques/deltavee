require "csv"

class PlanetCsvImporter
  ALL = :all

  def initialize(filename:, row_count: ALL, show_progress: false)
    @filename = filename
    @show_progress = show_progress
    @row_count = row_count
    check_file_exists
  end

  def import
    puts("Importing planets from #{@filename}") if @show_progress

    CSV.foreach(@filename, { col_sep: ";", headers: true }).with_index do |row, index|
      break if (@row_count != ALL) && (index >= @row_count)
      import_planet(row)
    end

    puts(" Done!") if @show_progress
  end

  def import_planet(row)
    planet_data = extract_planet_data(row)
    planet = Planet.new(planet_data)

    if planet.valid?
      print("🪐") if @show_progress
      planet.save
    elsif @show_progress
      print("❌") if @show_progress
      puts(planet.errors.full_messages.to_sentence)
    end
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
end
