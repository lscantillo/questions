require 'swagger_helper'

describe 'Employee Endpoint' do

  path '/api/employees' do

      post 'Creates a Employee' do
        tags 'Employees'
        consumes 'application/json'
        parameter name: :employee, in: :body, required: true, schema: {
          '$ref' => '#/definitions/employee'
        }

        response '200', 'employee created' do
          examples 'application/json' => {
            id: 1,
            full_name: "string",
            email: "string",
            is_admin: true,
            job_title: "string",
            profile_picture_url: "string",
            department_id: 1
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

      get 'Get all Employees' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Employees'
        produces 'application/json'

        response '200', 'employee list received' do
          examples 'application/json' => {
            data: [
              id: 1,
              full_name: "string",
              email: "string",
              is_admin: true,
              job_title: "string",
              profile_picture_url: "string",
              department_id: 1
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

    path '/api/employees/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { employee.id }

       put 'Update an Employee' do
         tags 'Employees'
         consumes 'application/json'
         parameter name: :employee, in: :body, required: true, schema: {
           '$ref' => '#/definitions/employee'
         }
         response '200', 'employee updated' do
           examples 'application/json' => {
             id: 1,
             full_name: "string",
             email: "string",
             is_admin: true,
             job_title: "string",
             profile_picture_url: "string",
             department_id: 1
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

       get 'Show an Employee by id' do
         tags 'Employees'
         produces 'application/json'
         response '200', 'employee updated' do
           examples 'application/json' => {
             id: 1,
             full_name: "string",
             email: "string",
             is_admin: true,
             job_title: "string",
             profile_picture_url: "string",
             department_id: 1
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

       delete 'Delete an Employee by id' do
         tags 'Employees'
         produces 'application/json'
         response '200', 'employee deleted' do
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

    path '/api/admins' do
      get 'Admin List' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Admins'
        produces 'application/json'

        response '200', 'Admins list received' do
          examples 'application/json' => {
            data: [
              id: 1,
              full_name: "string",
              email: "string",
              is_admin: true,
              job_title: "string",
              profile_picture_url: "string",
              department_id: 1
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
end
