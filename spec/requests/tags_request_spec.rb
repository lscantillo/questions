require 'rails_helper'

# Create tag test
describe 'POST tags', type: :request do
  it 'create a new tag' do
    params = {
      name: 'Test tag'
    }
    post '/api/tags', params: params
    expect(response).to have_http_status(:success)
  end
end

# Update tag test
describe 'PUT tag', type: :request do
  it 'returns an tag ' do
    FactoryBot.create(:tag)
    get '/api/tags'
    temp_body = JSON.parse(response.body)
    id = temp_body['data'][0]['id']
    # This the same info, real PUT params are based on the resources not hard coded
    params = {
      name: 'Test tag'
    }
    put "/api/tags/#{id}", params: params
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body['name']).to eq('Test tag')
  end
end

# Delete tag test
describe 'DELETE tag', type: :request do
  it 'Deletes an tag ' do
    FactoryBot.create(:tag)
    get '/api/tags'
    temp_body = JSON.parse(response.body)
    id = temp_body['data'][0]['id']
    delete "/api/tags/#{id}"
    expect(response).to have_http_status(:success)
  end
end

# Get all tags test
describe 'GET index tags', type: :request do
  it 'returns all tags ' do
    FactoryBot.create(:tag)
    get '/api/tags'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body['data'].size).to eq(1)
  end
end

# Show a single tag
describe 'SHOW tag', type: :request do
  it 'returns an tag ' do
    FactoryBot.create(:tag)
    get '/api/tags'
    temp_body = JSON.parse(response.body)
    id = temp_body['data'][0]['id']
    get "/api/tags/#{id}"
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body['id']).to eq(id)
  end
end
