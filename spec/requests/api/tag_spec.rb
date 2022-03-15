require 'swagger_helper'

describe 'tag Endpoint' do

  path '/api/tags' do

      post 'Creates a Tag' do
        tags 'Tags'
        consumes 'application/json'
        parameter name: :tag, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: [ 'name' ]
        }
        response '200', 'tag created' do
          let(:tag) { { name: 'foo' } }
          run_test!
        end
      end

      get 'Get all Tags' do
        tags 'Tags'
        produces 'application/json'

        response '200', 'tag list reveived' do
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
         parameter name: :tag, in: :body, schema: {
           type: :object,
           properties: {
             name: { type: :string }
           },
           required: [ 'name']
         }
         response '200', 'tag updated' do
          run_test!
         end
       end

       get 'Show a Tag by id' do
         tags 'Tags'
         produces 'application/json'
         response '200', 'tag updated' do
          run_test!
         end
       end

       delete 'Delete a Tag by id' do
         tags 'Tags'
         produces 'application/json'
         response '200', 'tag deleted' do
          run_test!
         end
       end
    end

end
