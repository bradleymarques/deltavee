# Import Systems from CSV file
importer = SystemCsvImporter.new(
  filename: Rails.root.join("data", "systems.csv"),
  row_count: :all,
  show_progress: true
)

importer.import

# Create System User
SystemUser.new.system_user

# Create some other Users (Players)
FactoryBot.create(
  :user,
  username: "new_player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj",
  has_signed_in_at_least_once: false
)

old_player = FactoryBot.create(
  :user,
  :with_received_notifications,
  :with_sent_notifications,
  username: "old_player",
  password: "Asdf;lkj",
  password_confirmation: "Asdf;lkj"
)

sol = System.find_by(name: "Sol")

FactoryBot.create(:fleet, owned_by: old_player, system: sol)
FactoryBot.create(:fleet, owned_by: old_player, system: sol)
FactoryBot.create(:fleet, owned_by: old_player, system: sol)
FactoryBot.create(:fleet, owned_by: old_player, system: sol)
