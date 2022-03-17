require 'swagger_helper'

describe 'Comment Endpoint' do

  path '/api/comments' do

      post 'Creates a Comment' do
        tags 'Comments'
        consumes 'application/json'
        parameter name: :comment, in: :body, required: true, schema: {
          type: :object,
          properties: {
            text_content: { type: :string },
            question_id: { type: :integer },
            is_answer: { type: :boolean }
          },
          required: [ 'text_content', 'question_id' ]
        }
        response '200', 'comment created' do
          let(:comment) { { text_content: 'foo', question_id: 0 } }
          run_test!
        end
      end

      get 'Get all Comments' do
        parameter name: :items, in: :query, type: :integer,required: false
        parameter name: :page, in: :query, type: :integer,required: false
        tags 'Comments'
        produces 'application/json'

        response '200', 'comment list received' do
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
           type: :object,
           properties: {
             text_content: { type: :string },
             question_id: { type: :integer },
             is_answer: { type: :boolean }
           },
           required: [ 'text_content', 'question_id' ]
         }
         response '200', 'comment updated' do
          run_test!
         end
       end

       get 'Show a Comment by id' do
         tags 'Comments'
         produces 'application/json'
         response '200', 'comment updated' do
          run_test!
         end
       end

       delete 'Delete a Comment by id' do
         tags 'Comments'
         produces 'application/json'
         response '200', 'comment deleted' do
          run_test!
         end
       end
    end

end
