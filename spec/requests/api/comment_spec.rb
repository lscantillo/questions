require 'swagger_helper'

describe 'Comment Endpoint' do

  path '/api/comments' do

      post 'Creates a Comment' do
        tags 'Comments'
        consumes 'application/json'
        parameter name: :comment, in: :body, required: true, schema: {
          '$ref' => '#/definitions/comment'
        }
        response '200', 'comment created' do
          examples 'application/json' => {
            id: 1,
            text_content: "string",
            is_answer: false,
            created_at: "date"
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

      get 'Get all Comments' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Comments'
        produces 'application/json'

        response '200', 'comment list received' do
          examples 'application/json' => {
            data: [
              id: 1,
              text_content: "string",
              is_answer: false,
              created_at: "date",
              employee: {
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
    end

    path '/api/comments/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { comment.id }

       put 'Update a Comment' do
         tags 'Comments'
         consumes 'application/json'
         parameter name: :comment, in: :body, required: true, schema: {
             '$ref' => '#/definitions/comment'
         }
         response '200', 'comment updated' do
           examples 'application/json' => {
             id: 1,
             text_content: "string",
             is_answer: false,
             created_at: "date",
             employee: {
               id: 0,
               full_name: "string",
               email: "string",
               is_admin: false,
               job_title: "string",
               profile_picture_url: "string",
               department_id: 0
             }
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

       get 'Show a Comment by id' do
         tags 'Comments'
         produces 'application/json'
         response '200', 'comment updated' do
           examples 'application/json' => {
             id: 1,
             text_content: "string",
             is_answer: false,
             created_at: "date",
             employee: {
               id: 0,
               full_name: "string",
               email: "string",
               is_admin: false,
               job_title: "string",
               profile_picture_url: "string",
               department_id: 0
             }
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

       delete 'Delete a Comment by id' do
         tags 'Comments'
         produces 'application/json'
         response '200', 'comment deleted' do
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
