FactoryBot.define do
  factory :spaceship do
    name { NameGenerators::SpaceshipNameGenerator.new.generate }
    owned_by { FactoryBot.build(:user) }
    ship_class { "frigate" }
  end
end
