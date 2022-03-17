require 'swagger_helper'

RSpec.describe 'api/questions', type: :request do
  path '/api/questions' do
    get('list questions') do
      tags 'Questions'
      parameter name: 'layout', in: :query, type: :string, default: 'classic'
      parameter name: 'items', in: :query, type: :integer

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :question, in: :body, required: true, schema: {
        type: :object,
        properties: {
          header: { type: :string },
          text_content: { type: :string },
          is_anonymous: { type: :boolean },
          employee_id: { type: :integer },
          assigned_to_employee_id: { type: :integer },
          department_id: { type: :integer },
          location_id: { type: :integer }
        },
        required: %w[header text_content]
      }

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
    end

    patch('update question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :question, in: :body, required: true, schema: {
        type: :object,
        properties: {
          header: { type: :string },
          text_content: { type: :string },
          is_anonymous: { type: :boolean },
          employee_id: { type: :integer },
          assigned_to_employee_id: { type: :integer },
          department_id: { type: :integer },
          location_id: { type: :integer }
        },
        required: %w[header text_content]
      }

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
    end

    put('update question') do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :question, in: :body, required: true, schema: {
        type: :object,
        properties: {
          header: { type: :string },
          text_content: { type: :string },
          is_anonymous: { type: :boolean },
          employee_id: { type: :integer },
          assigned_to_employee_id: { type: :integer },
          department_id: { type: :integer },
          location_id: { type: :integer }
        },
        required: %w[header text_content]
      }
      
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
    end
  end
end
