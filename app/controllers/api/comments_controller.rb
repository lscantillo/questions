class Api::CommentsController < ApplicationController
  include RestApiController
  @permited_params = %i[text_content is_answer session_hash employee_id question_id]
end
