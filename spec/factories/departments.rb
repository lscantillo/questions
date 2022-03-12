FactoryBot.define do
  factory :department do
    name { "Test Department" }
    abbreviation  { "TDEP" }
    is_active { true }
  end
end
