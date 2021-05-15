FactoryBot.define do
  factory :system do
    x { Faker::Number.between(from: 1, to: 10_000) }
    y { Faker::Number.between(from: 1, to: 10_000) }
    z { Faker::Number.between(from: 1, to: 10_000) }
    name { SystemNameGenerator.new.generate }
  end
end
