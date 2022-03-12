FactoryBot.define do
  factory :question do
    header { "Default Header"}
    text_content { "Default Text Content"}
    is_anonymous { true }
  end
end
