require 'rails_helper'

# Create department test
describe 'POST departments', type: :request do
  it 'create a new department' do
    params = {
      department: {
        name: "Test Dept",
        is_active: true,
        abbreviatio: "TEST"
      }
    }
    post '/api/departments', params: params
    expect(response).to have_http_status(:success)
  end
end

# Update department test
describe 'PUT department', type: :request do
  it 'returns an department ' do
    FactoryBot.create(:department)
    get '/api/departments'
    temp_body = JSON.parse(response.body)
    id = temp_body["departments"][0]["id"]
    # This the same info, real PUT params are based on the resources not hard coded
    params = {
      department: {
        name: "Updated Dept",
        is_active: true,
        abbreviatio: "TEST"
      }
    }
    put "/api/departments/#{id}", params: params
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["department"]["name"]).to eq("Updated Dept")
  end
end

# Delete department test
describe 'DELETE department', type: :request do
  it 'Deletes an department ' do
    FactoryBot.create(:department)
    get '/api/departments'
    temp_body = JSON.parse(response.body)
    id = temp_body["departments"][0]["id"]
    delete "/api/departments/#{id}"
    expect(response).to have_http_status(:success)
  end
end

# Get all departments test
describe 'GET index departments', type: :request do
  it 'returns all departments ' do
    FactoryBot.create(:department)
    get '/api/departments'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["departments"].size).to eq(1)
  end
end

# Show a single department
describe 'SHOW department', type: :request do
  it 'returns an department ' do
    FactoryBot.create(:department)
    get '/api/departments'
    temp_body = JSON.parse(response.body)
    id = temp_body["departments"][0]["id"]
    get "/api/departments/#{id}"
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["department"]["id"]).to eq(id)
  end
end
