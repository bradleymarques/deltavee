FactoryBot.define do
  factory :system do
    name { Faker::Alphanumeric.alpha(number: 10) }
    x { Faker::Number.between(from: 100, to: 100_000) }
    y { Faker::Number.between(from: 100, to: 100_000) }
    z { Faker::Number.between(from: 100, to: 100_000) }

    trait(:sol) do
      name { "Sol" }
      x { 0.0 }
      y { 0.0 }
      z { 0.0 }
    end
  end
end
