FactoryBot.define do
  factory :question do
    header { Faker::Lorem.question }
    text_content { Faker::Lorem.paragraph(sentence_count: 5) }
    is_anonymous { true }
  end
end
