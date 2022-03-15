require 'swagger_helper'

describe 'department Endpoint' do

  path '/api/departments' do

      post 'Creates a Department' do
        tags 'Departments'
        consumes 'application/json'
        parameter name: :department, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            abbreviation: { type: :string },
            is_active: { type: :boolean }
          },
          required: [ 'name', 'is_active' ]
        }
        response '200', 'department created' do
          let(:department) { { name: 'foo', is_active: true } }
          run_test!
        end
      end

      get 'Get all Departments' do
        tags 'Departments'
        produces 'application/json'

        response '200', 'department list reveived' do
          run_test!
        end
      end
    end

    path '/api/departments/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { department.id }

       put 'Update a Department' do
         tags 'Departments'
         consumes 'application/json'
         parameter name: :department, in: :body, schema: {
           type: :object,
           properties: {
             name: { type: :string },
             abbreviation: { type: :string },
             is_active: { type: :boolean }
           },
           required: [ 'name', 'is_active' ]
         }
         response '200', 'department updated' do
          run_test!
         end
       end

       get 'Show a Department by id' do
         tags 'Departments'
         produces 'application/json'
         response '200', 'department updated' do
          run_test!
         end
       end

       delete 'Delete a Department by id' do
         tags 'Departments'
         produces 'application/json'
         response '200', 'department deleted' do
          run_test!
         end
       end
    end

end
