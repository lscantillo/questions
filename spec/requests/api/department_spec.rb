require 'swagger_helper'

describe 'department Endpoint' do

  path '/api/departments' do

      post 'Creates a Department' do
        tags 'Departments'
        consumes 'application/json'
        parameter name: :department, in: :body, required: true, schema: {
          '$ref' => '#/definitions/department'
        }
        response '200', 'department created' do
          examples 'application/json' => {
            id: 1,
            name: "string",
            is_active: true,
            abbreviation: "string",
            employees: [
              {
                id: 0,
                full_name: "string",
                email: "string",
                is_admin: false,
                job_title: "string",
                profile_picture_url: "string",
                department_id: 0
              }
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
      end

      get 'Get all Departments' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Departments'
        produces 'application/json'

        response '200', 'department list received' do
          run_test!
          examples 'application/json' => {
            data: [
              id: 1,
              name: "string",
              is_active: true,
              abbreviation: "string",
              employees: [
                {
                  id: 0,
                  full_name: "string",
                  email: "string",
                  is_admin: false,
                  job_title: "string",
                  profile_picture_url: "string",
                  department_id: 0
                }
              ]
            ]
          }
        end
        response '400', 'Bad Request' do
          examples 'application/json' => {
            "error": 0,
            "message": "string"
          }
          run_test!
        end
        response '404', 'Resource not Found' do
          run_test!
        end
        response '401', 'Authentication failed' do
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
         parameter name: :department, in: :body, required: true, schema: {
           '$ref' => '#/definitions/department'
         }
         response '200', 'department updated' do
           examples 'application/json' => {
             id: 1,
             name: "string",
             is_active: true,
             abbreviation: "string",
             employees: [
               {
                 id: 0,
                 full_name: "string",
                 email: "string",
                 is_admin: false,
                 job_title: "string",
                 profile_picture_url: "string",
                 department_id: 0
               }
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
         response '409', 'No changes' do
           run_test!
         end
       end

       get 'Show a Department by id' do
         tags 'Departments'
         produces 'application/json'
         response '200', 'department updated' do
           examples 'application/json' => {
             id: 1,
             name: "string",
             is_active: true,
             abbreviation: "string",
             employees: [
               {
                 id: 0,
                 full_name: "string",
                 email: "string",
                 is_admin: false,
                 job_title: "string",
                 profile_picture_url: "string",
                 department_id: 0
               }
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

       delete 'Delete a Department by id' do
         tags 'Departments'
         produces 'application/json'
         response '200', 'department deleted' do
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
