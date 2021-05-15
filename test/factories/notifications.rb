FactoryBot.define do
  factory :notification do
    subject { Faker::Lorem.words(number: 3) }
    sender { FactoryBot.create(:user) }
    recipient { FactoryBot.create(:user) }
    content { ActionText::RichText.new(body: Faker::Lorem.words(number: 50)) }
  end
end
