require 'swagger_helper'

describe 'location Endpoint' do

  path '/api/locations' do

      post 'Creates a Location' do
        tags 'Locations'
        consumes 'application/json'
        parameter name: :location, in: :body, required: true, schema: {
          '$ref' => '#/definitions/location'
        }
        response '200', 'location created' do
          examples 'application/json' => {
            id: 1,
            name: "string",
            code: "string"
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

      get 'Get all Locations' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Locations'
        produces 'application/json'

        response '200', 'location list received' do
          examples 'application/json' => {
            data: [
              id: 1,
              name: "string",
              code: "string"
            ]
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
        response '404', 'Resource not Found' do
          run_test!
        end
      end
    end

    path '/api/locations/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { location.id }

       put 'Update a Location' do
         tags 'Locations'
         consumes 'application/json'
         parameter name: :location, in: :body, required: true, schema: {
           '$ref' => '#/definitions/location'
         }
         response '200', 'location updated' do
           examples 'application/json' => {
             id: 1,
             name: "string",
             code: "string"
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
         response '404', 'Resource not Found' do
           run_test!
         end
         response '409', 'No changes' do
           run_test!
         end
       end

       get 'Show a Location by id' do
         tags 'Locations'
         produces 'application/json'
         response '200', 'location updated' do
           examples 'application/json' => {
             id: 1,
             name: "string",
             code: "string"
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
         response '404', 'Resource not Found' do
           run_test!
         end
       end

       delete 'Delete a Location by id' do
         tags 'Locations'
         produces 'application/json'
         response '200', 'location deleted' do
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
