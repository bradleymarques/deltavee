FactoryBot.define do
  factory :system do
    name { NameGenerators::SystemNameGenerator.new.generate }
    x { Faker::Number.between(from: 1, to: 10_000) }
    y { Faker::Number.between(from: 1, to: 10_000) }
    z { Faker::Number.between(from: 1, to: 10_000) }
    giliese_catalogue_name { NameGenerators::SystemNameGenerator.new.generate }
    bayer_flamsteed_designation { NameGenerators::SystemNameGenerator.new.generate }
    absolute_magnitude { Faker::Number.between(from: 1, to: 100) }
    spectral_type { ["G2V", "K1V", "sdM4"].sample }
    colour_index { Faker::Number.between(from: -1.0, to: 1.0) }
    constellation { nil }
    luminosity { Faker::Number.between(from: 0.0, to: 1.0) }

    trait(:sol) do
      name { "Sol" }
      x { 0.000005 }
      y { 0.0 }
      z { 0.0 }
      giliese_catalogue_name { nil }
      bayer_flamsteed_designation { nil }
      absolute_magnitude { 4.850 }
      spectral_type { "G2V" }
      colour_index { 0.656 }
      constellation { nil }
      luminosity { 1 }
    end

    trait(:proxima_centauri) do
      name { "Proxima Centauri" }
      x { -0.472264 }
      y { -0.361451 }
      z { -1.151219 }
      giliese_catalogue_name { "Gl 551" }
      bayer_flamsteed_designation { nil }
      absolute_magnitude { 15.447 }
      spectral_type { "M5Ve" }
      colour_index { 1.807 }
      constellation { "Cen" }
      luminosity { 0.00005770321353329293 }
    end
  end
end
