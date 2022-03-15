FactoryBot.define do
  factory :location do
    name { Faker::Address.city }
    code { Faker::Address.state_abbr }
  end
end
