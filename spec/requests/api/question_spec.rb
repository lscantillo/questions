require 'swagger_helper'

describe 'Questions API' do
  path 'api/questions' do
    post 'Create Question' do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :question, in: :body, schema: { 
        type: :object,
        properties: { 
          employee_id: { type: :integer },
          assigned_to_employee_id: { type: :integer },
          department_id: { type: :integer },
          location_id: { type: :integer },
          is_anonymous: { type: :boolean },
          header: { type: :string },
          text_content: { type: :string },
          tags: { type: :array }
         },
        
       }
    end
  end
end
