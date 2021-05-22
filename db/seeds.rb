# Import Systems from CSV file
importer = SystemCsvImporter.new(
  filename: Rails.root.join("data", "systems.csv"),
  row_count: 10,
  show_progress: true
)

importer.import

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
  :with_received_notifications,
  :with_sent_notifications,
  username: "old_player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)
