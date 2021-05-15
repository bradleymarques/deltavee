# Import Systems from CSV file
importer = SystemCsvImporter.new(
  filename: Rails.root.join("data", "systems.csv"),
  row_count: 500,
  show_progress: true
)

importer.import

FactoryBot.create(
  :user,
  username: "player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)
