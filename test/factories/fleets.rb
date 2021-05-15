FactoryBot.define do
  factory :fleet do
    name { "Fleet" }
    owned_by { FactoryBot.create(:user) }
    system { FactoryBot.create(:system) }
  end
end
