# Import Stars from CSV file
puts "Importing Stars from /data/stars.csv"
StarCsvImporter.new(
  filename: Rails.root.join("data", "stars.csv"),
  show_progress: true
).import

# Import Planets from CSV file
puts "Importing Planets from /data/planets_with_stars.csv"
PlanetCsvImporter.new(
  filename: Rails.root.join("data", "planets_with_stars.csv"),
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
