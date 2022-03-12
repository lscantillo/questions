FactoryBot.define do
  factory :department do
    name { "Default Department" }
    abbreviation  { "TDEP" }
    is_active { true }
  end
end
