require 'swagger_helper'

describe 'tag Endpoint' do

  path '/api/tags' do

      post 'Creates a Tag' do
        tags 'Tags'
        consumes 'application/json'
        parameter name: :tag, in: :body ,required: true, schema: {
          '$ref' => '#/definitions/tag'
        }
        response '200', 'tag created' do
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

      get 'Get all Tags' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Tags'
        produces 'application/json'

        response '200', 'tag list received' do
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

    path '/api/tags/{id}' do
       parameter name: :id, in: :path, type: :string
       let(:id) { tag.id }

       put 'Update a Tag' do
         tags 'Tags'
         consumes 'application/json'
         parameter name: :tag, in: :body ,required: true, schema: {
           '$ref' => '#/definitions/tag'
         }
         response '200', 'tag updated' do
           examples 'application/json' => {
             id: 1,
             name: "string",
             code: "string"
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

       get 'Show a Tag by id' do
         tags 'Tags'
         produces 'application/json'
         response '200', 'tag updated' do
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

       delete 'Delete a Tag by id' do
         tags 'Tags'
         produces 'application/json'
         response '200', 'tag deleted' do
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
