##
# Imports systems from a CSV file
#
class SystemCsvImporter
  def initialize(filename:)
    @filename = filename
    check_file_exists
  end
end
