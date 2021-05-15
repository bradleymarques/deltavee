FactoryBot.define do
  factory :spaceship do
    name { SpaceshipNameGenerator.new.generate }
    owned_by { FactoryBot.build(:user) }
    ship_class { "frigate" }
  end
end
