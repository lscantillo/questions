FactoryBot.define do
  factory :employee do
    full_name { "John Doe" }
    email { "JohnDoe@fake.com" }
    job_title { "NiNi" }
    is_admin { false }
    profile_picture_url { "https://via.placeholder.com/150" }
  end
end
