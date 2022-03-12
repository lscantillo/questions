require 'rails_helper'

# Create Employee test
describe 'POST employees', type: :request do
  it 'create a new employee' do
    params = {
      employee: {
        full_name: "John Doe",
        email: "JohnDoe@fake.com",
        job_title: "NiNi",
        is_admin: false,
        profile_picture_url: "https://via.placeholder.com/150"
      }
    }
    post '/api/employees', params: params
    expect(response).to have_http_status(:success)
  end
end

# Update Employee test
describe 'PUT employee', type: :request do
  it 'returns an employee ' do
    FactoryBot.create(:employee)
    get '/api/employees'
    temp_body = JSON.parse(response.body)
    id = temp_body["employees"][0]["id"]
    # This the same info, real PUT params are based on the resources not hard coded
    params = {
      employee: {
        full_name: "New Name",
        email: "JohnDoe@fake.com",
        job_title: "NiNi",
        is_admin: false,
        profile_picture_url: "https://via.placeholder.com/150"
      }
    }
    put "/api/employees/#{id}", params: params
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["employee"]["full_name"]).to eq("New Name")
  end
end

# Delete Employee test
describe 'DELETE employee', type: :request do
  it 'Deletes an employee ' do
    FactoryBot.create(:employee)
    get '/api/employees'
    temp_body = JSON.parse(response.body)
    id = temp_body["employees"][0]["id"]
    delete "/api/employees/#{id}"
    expect(response).to have_http_status(:success)
  end
end

# Get all Employees test
describe 'GET index employees', type: :request do
  it 'returns all employees ' do
    FactoryBot.create(:employee)
    get '/api/employees'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["employees"].size).to eq(1)
  end
end

# Get Admin list test
describe 'GET admins',type: :request do
  it 'returns all employees ' do
    FactoryBot.create(:employee,is_admin: true)
    get '/api/admins'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["employees"][0]["is_admin"]).to eq(true)
  end
end

# Show a single employee
describe 'SHOW employee', type: :request do
  it 'returns an employee ' do
    FactoryBot.create(:employee)
    get '/api/employees'
    temp_body = JSON.parse(response.body)
    id = temp_body["employees"][0]["id"]
    get "/api/employees/#{id}"
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["employee"]["id"]).to eq(id)
  end
end
