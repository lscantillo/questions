require 'swagger_helper'

describe 'location Endpoint' do

  path '/api/locations' do

      post 'Creates a Location' do
        tags 'Locations'
        consumes 'application/json'
        parameter name: :location, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            code: { type: :string }
          },
          required: [ 'name', 'code' ]
        }
        response '200', 'location created' do
          let(:location) { { name: 'foo', code: 'TODO' } }
          run_test!
        end
      end

      get 'Get all Locations' do
        tags 'Locations'
        produces 'application/json'

        response '200', 'location list reveived' do
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
         parameter name: :location, in: :body, schema: {
           type: :object,
           properties: {
             name: { type: :string },
             code: { type: :string }
           },
           required: [ 'name', 'code' ]
         }
         response '200', 'location updated' do
          run_test!
         end
       end

       get 'Show a Location by id' do
         tags 'Locations'
         produces 'application/json'
         response '200', 'location updated' do
          run_test!
         end
       end

       delete 'Delete a Location by id' do
         tags 'Locations'
         produces 'application/json'
         response '200', 'location deleted' do
          run_test!
         end
       end
    end

end
