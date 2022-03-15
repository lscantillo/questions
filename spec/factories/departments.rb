FactoryBot.define do
  factory :department do
    name { Faker::Educator.subject }
    abbreviation { Faker::Hacker.abbreviation }
    is_active { true }
  end
end
