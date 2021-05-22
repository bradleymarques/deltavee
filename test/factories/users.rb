FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..128) }
    email { Faker::Internet.unique.email }
    password { "some-strong-password" }
    password_confirmation { "some-strong-password" }
    confirmed_at { 1.hour.ago }
    has_signed_in_at_least_once { true }
    role { 'player' }

    trait(:unconfirmed) do
      confirmed_at { nil }
    end
  end
end
