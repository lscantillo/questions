FactoryBot.define do
  factory :comment do
    text_content { Faker::Lorem.sentence }
  end
end
