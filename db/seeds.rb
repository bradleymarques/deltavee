# Import Systems from CSV file
importer = SystemCsvImporter.new(
  filename: Rails.root.join("data", "systems.csv"),
  row_count: 5000,
  show_progress: true
)

importer.import

FactoryBot.create(
  :user,
  username: "player",
  password: "Asdfg;lkjh",
  password_confirmation: "Asdfg;lkjh"
)
