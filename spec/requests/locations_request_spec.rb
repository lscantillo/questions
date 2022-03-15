require 'rails_helper'

# Create location test
describe 'POST locations', type: :request do
  it 'create a new location' do
    params = {
      location: {
        name: "Test Location",
        code: "TLOC"
      }
    }
    post '/api/locations', params: params
    expect(response).to have_http_status(:success)
  end
end

# Update location test
describe 'PUT location', type: :request do
  it 'returns an location ' do
    FactoryBot.create(:location)
    get '/api/locations'
    temp_body = JSON.parse(response.body)
    id = temp_body["locations"][0]["id"]
    # This the same info, real PUT params are based on the resources not hard coded
    params = {
      location: {
        name: "Test Location",
        code: "TLOC"
      }
    }
    put "/api/locations/#{id}", params: params
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["location"]["name"]).to eq("Test Location")
  end
end

# Delete location test
describe 'DELETE location', type: :request do
  it 'Deletes an location ' do
    FactoryBot.create(:location)
    get '/api/locations'
    temp_body = JSON.parse(response.body)
    id = temp_body["locations"][0]["id"]
    delete "/api/locations/#{id}"
    expect(response).to have_http_status(:success)
  end
end

# Get all locations test
describe 'GET index locations', type: :request do
  it 'returns all locations ' do
    FactoryBot.create(:location)
    get '/api/locations'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["locations"].size).to eq(1)
  end
end


# Show a single location
describe 'SHOW location', type: :request do
  it 'returns an location ' do
    FactoryBot.create(:location)
    get '/api/locations'
    temp_body = JSON.parse(response.body)
    id = temp_body["locations"][0]["id"]
    get "/api/locations/#{id}"
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["location"]["id"]).to eq(id)
  end
end
