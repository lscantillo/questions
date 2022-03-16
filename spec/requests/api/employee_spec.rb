require 'swagger_helper'

describe 'Employee Endpoint' do

  path '/api/employees' do

      post 'Creates a Employee' do
        tags 'Employees'
        consumes 'application/json'
        parameter name: :employee, in: :body, required: true, schema: {
          type: :object,
          properties: {
            full_name: { type: :string },
            email: { type: :string },
            is_admin: { type: :boolean },
            job_title: { type: :string },
            profile_picture_url: { type: :string }
          },
          required: [ 'full_name', 'email' ]
        }

        response '200', 'employee created' do
          let(:employee) { { full_name: 'foo', email: 'bar' } }
          run_test!
        end
      end

      get 'Get all Employees' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Employees'
        produces 'application/json'

        response '200', 'employee list received' do
          run_test!
        end
      end
    end

    path '/api/employees/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { employee.id }

       put 'Update an Employee' do
         tags 'Employees'
         consumes 'application/json'
         parameter name: :employee, in: :body, required: true, schema: {
           type: :object,
           properties: {
             full_name: { type: :string },
             email: { type: :string },
             is_admin: { type: :boolean },
             job_title: { type: :string },
             profile_picture_url: { type: :string }
           },
           required: [ 'full_name', 'email' ]
         }
         response '200', 'employee updated' do
          run_test!
         end
       end

       get 'Show an Employee by id' do
         tags 'Employees'
         produces 'application/json'
         response '200', 'employee updated' do
          run_test!
         end
       end

       delete 'Delete an Employee by id' do
         tags 'Employees'
         produces 'application/json'
         response '200', 'employee deleted' do
          run_test!
         end
       end
    end

    path '/api/admins' do
      get 'Admin List' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Admins'
        produces 'application/json'

        response '200', 'employee list received' do
          run_test!
        end
      end
    end
end
