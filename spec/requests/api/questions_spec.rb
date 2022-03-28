require 'swagger_helper'

RSpec.describe 'api/questions', type: :request do
  path '/api/questions' do
    get('list questions') do
      tags 'Questions'
      parameter name: 'layout', in: :query, type: :string, default: 'classic'
      parameter name: 'items', in: :query, type: :integer

      response(200, 'successful') do
        examples 'application/json' => {
          data: [
            id: 0,
            header: "string",
            created_at: "date",
            vote_count: 0,
            comment_count: 0,
            is_anonymous: true,
            text_content: "string"
          ]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
      response '404', 'Resource not Found' do
        run_test!
      end
    end

    post('create question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :comment, in: :body, required: true, schema: {
        '$ref' => '#/definitions/question'
      }

      response(200, 'successful') do
        examples 'application/json' => {
          id: 0,
          header: "string",
          created_at: "date",
          vote_count: 0,
          comment_count: 0,
          is_anonymous: true,
          text_content: "string"
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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

  path '/api/questions/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show question') do
      tags 'Questions'
      response(200, 'successful') do
        examples 'application/json' => {
          id: 0,
          header: "string",
          created_at: "date",
          vote_count: 0,
          comment_count: 0,
          is_anonymous: true,
          text_content: "string"
        }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
      response '404', 'Resource not Found' do
        run_test!
      end
      response '409', 'No changes' do
        run_test!
      end
    end

    patch('update question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :comment, in: :body, required: true, schema: {
        '$ref' => '#/definitions/question'
      }

      response(200, 'successful') do
        examples 'application/json' => {
          id: 0,
          header: "string",
          created_at: "date",
          vote_count: 0,
          comment_count: 0,
          is_anonymous: true,
          text_content: "string"
        }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
      response '404', 'Resource not Found' do
        run_test!
      end
      response '409', 'No changes' do
        run_test!
      end
    end

    put('update question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :comment, in: :body, required: true, schema: {
        '$ref' => '#/definitions/question'
      }

      response(200, 'successful') do
        examples 'application/json' => {
          id: 0,
          header: "string",
          created_at: "date",
          vote_count: 0,
          comment_count: 0,
          is_anonymous: true,
          text_content: "string"
        }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
      response '404', 'Resource not Found' do
        run_test!
      end
      response '409', 'No changes' do
        run_test!
      end
    end

    delete('delete question') do
      tags 'Questions'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '401', 'Authentication failed' do
        run_test!
      end
      response '404', 'Resource not Found' do
        run_test!
      end
    end
  end
end
