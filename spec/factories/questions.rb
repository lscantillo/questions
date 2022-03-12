FactoryBot.define do
  factory :question do
    header { "Test Header"}
    text_content { "Test Text Content"}
    is_anonymous { true }
  end
end
