require 'swagger_helper'

describe 'HealthCheck' do

  path '/healthcheck' do
    get 'View status' do
      tags 'HealthCheck'
      consumes 'application/json'
      response '200', 'Success' do
        schema(
          type: :object,
          properties: {
            code: { type: :number },
            status: {
              type: :array
            }
          }
        )
        run_test!
      end

      response '503', 'Service Unavailable' do
        schema(
          type: :object,
          properties: {
            code: { type: :number },
            errors: {
              type: :array
            }
          }
        )
        run_test!
      end
    end
  end
end
