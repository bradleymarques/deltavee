# Import Stars from CSV file
StarCsvImporter.new(
  filename: Rails.root.join("data", "stars.csv"),
  row_count: :all,
  show_progress: true
).import

# Import Planets from CSV file
PlanetCsvImporter.new(
  filename: Rails.root.join("data", "planets.csv"),
  row_count: :all,
  show_progress: true
).import

# Create some other Users (Players)
FactoryBot.create(
  :user,
  username: "new_player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj",
  has_signed_in_at_least_once: false
)

FactoryBot.create(
  :user,
  username: "old_player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)
