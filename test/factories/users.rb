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

    trait(:with_sent_notifications) do
      after(:build) do |instance|
        instance.sent_notifications = [
          FactoryBot.create(:notification, sender: instance)
        ]
      end
    end

    trait(:with_received_notifications) do
      after(:build) do |instance|
        instance.received_notifications = FactoryBot.create_list(
          :notification,
          5,
          recipient: instance
        )
      end
    end
  end
end
