FactoryBot.define do
  factory :system do
    x_position { Faker::Number.between(from: 1, to: 100_000) }
    y_position { Faker::Number.between(from: 1, to: 100_000) }
    z_position { Faker::Number.between(from: 1, to: 100_000) }
    proper_name { Faker::Lorem.word }
  end
end
