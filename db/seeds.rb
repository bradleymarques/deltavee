# Import Systems from CSV file
importer = SystemCsvImporter.new(
  filename: Rails.root.join("data", "systems.csv"),
  row_count: 500,
  show_progress: true
)

importer.import

FactoryBot.create(
  :user,
  username: "player_1",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj",
  has_signed_in_at_least_once: false
)

FactoryBot.create(
  :user,
  username: "player_2",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)

FactoryBot.create(
  :user,
  username: "player_3",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)
