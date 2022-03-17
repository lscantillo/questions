require 'rails_helper'

# Create comment test
describe 'POST comments', type: :request do
  it 'create a new comment' do
    FactoryBot.create(:question)
    get '/api/questions'
    temp_body = JSON.parse(response.body)
    id = temp_body["data"]["questions"][0]["id"]
    params = {
      comment: {
        text_content: "Test Comment Content",
        question_id: id
      }
    }
    post '/api/comments', params: params
    expect(response).to have_http_status(:success)
  end
end

# Update comment test
describe 'PUT comment', type: :request do
  it 'returns an comment ' do
    FactoryBot.create(:question)
    get '/api/questions'
    temp_body = JSON.parse(response.body)
    question_id = temp_body["data"]["questions"][0]["id"]
    FactoryBot.create(:comment, question_id: question_id)
    get '/api/comments'
    temp_body = JSON.parse(response.body)
    id = temp_body["data"]["comments"][0]["id"]
    # This the same info, real PUT params are based on the resources not hard coded
    params = {
      comment: {
        text_content: "Updated Comment Content"
      }
    }
    put "/api/comments/#{id}", params: params
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["comment"]["text_content"]).to eq("Updated Comment Content")
  end
end

# Delete comment test
describe 'DELETE comment', type: :request do
  it 'Deletes an comment ' do
    FactoryBot.create(:question)
    get '/api/questions'
    temp_body = JSON.parse(response.body)
    question_id = temp_body["data"]["questions"][0]["id"]
    FactoryBot.create(:comment, question_id: question_id)
    get '/api/comments'
    temp_body = JSON.parse(response.body)
    id = temp_body["data"]["comments"][0]["id"]
    delete "/api/comments/#{id}"
    expect(response).to have_http_status(:success)
  end
end

# Get all comments test
describe 'GET index comments', type: :request do
  it 'returns all comments ' do
    FactoryBot.create(:question)
    get '/api/questions'
    temp_body = JSON.parse(response.body)
    question_id = temp_body["data"]["questions"][0]["id"]
    FactoryBot.create(:comment, question_id: question_id)
    get '/api/comments'
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["data"]["comments"].size).to eq(1)
  end
end

# Show a single comment
describe 'SHOW comment', type: :request do
  it 'returns an comment ' do
    FactoryBot.create(:question)
    get '/api/questions'
    temp_body = JSON.parse(response.body)
    question_id = temp_body["data"]["questions"][0]["id"]
    FactoryBot.create(:comment, question_id: question_id)
    get '/api/comments'
    temp_body = JSON.parse(response.body)
    id = temp_body["data"]["comments"][0]["id"]
    get "/api/comments/#{id}"
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body["comment"]["id"]).to eq(id)
  end
end
