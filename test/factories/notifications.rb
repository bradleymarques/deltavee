FactoryBot.define do
  factory :notification do
    subject { Faker::Lorem.words(number: 3).join(" ") }
    sender { FactoryBot.create(:user) }
    recipient { FactoryBot.create(:user) }
    content { ActionText::RichText.new(body: Faker::Lorem.paragraphs(number: 10).join("\n")) }
    read { false }
  end
end
