require 'swagger_helper'

describe 'vote Endpoint' do

  path '/api/votes' do

    post 'Creates a Vote' do
      tags 'Votes'
      consumes 'application/json'
      parameter name: :vote, in: :body, required: true, schema: {
        '$ref' => '#/definitions/vote'
      }
      response '200', 'vote created' do
        examples 'application/json' => {
          is_up_vote: true,
          question_id: 1
        }
        run_test!
      end
      response '400', 'Bad Request' do
        examples 'application/json' => {
          "error": 0,
          "message": "string"
        }
        run_test!
      end
      response '401', 'Authentication failed' do
        run_test!
      end
    end
    delete 'Deletes a Vote' do
      tags 'Votes'
      consumes 'application/json'
      parameter name: :vote, in: :body, required: true, schema: {
        type: :object,
        properties: {
          question_id: { type: :integer },
        }
      }
      response '200', 'vote created' do
        examples 'application/json' => {
          is_up_vote: true,
          question_id: 1
        }
        run_test!
      end
      response '400', 'Bad Request' do
        examples 'application/json' => {
          "error": 0,
          "message": "string"
        }
        run_test!
      end
      response '401', 'Authentication failed' do
        run_test!
      end
    end
  end
end
