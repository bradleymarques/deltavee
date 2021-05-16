FactoryBot.define do
  factory :spaceship do
    name { NameGenerators::SpaceshipNameGenerator.new.generate }
    owned_by { FactoryBot.create(:user) }
    fleet { FactoryBot.create(:fleet, owned_by: owned_by) }
  end
end
