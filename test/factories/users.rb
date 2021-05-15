FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..128) }
    email { Faker::Internet.unique.email }
    password { "some-strong-password" }
    password_confirmation { "some-strong-password" }
    confirmed_at { 1.hour.ago }

    trait(:unconfirmed) do
      confirmed_at { nil }
    end

    trait(:with_sent_notifications) do
      sent_notifications { [] }
    end

    trait(:with_received_notifications) do
      received_notifications { [] }
    end
  end
end
