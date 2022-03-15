FactoryBot.define do
  factory :employee do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    job_title { Faker::Job.title }
    is_admin { false }
    profile_picture_url { Faker::LoremFlickr.image }
  end
end
