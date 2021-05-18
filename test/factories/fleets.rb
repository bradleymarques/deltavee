FactoryBot.define do
  factory :fleet do
    name { Faker::Lorem.word }
    owned_by { FactoryBot.create(:user) }
    system { FactoryBot.create(:system) }

    after(:build) do |instance|
      instance.spaceships = FactoryBot.build_list(
        :spaceship,
        Faker::Number.between(from: 2, to: 5),
        fleet: instance,
        owned_by: instance.owned_by
      )
    end
  end
end
