FactoryBot.define do
  factory :system do
    x_parsecs { Faker::Number.between(from: 1, to: 100_000) }
    y_parsecs { Faker::Number.between(from: 1, to: 100_000) }
    z_parsecs { Faker::Number.between(from: 1, to: 100_000) }
    name { SystemNameGenerator.new.generate }
  end
end
