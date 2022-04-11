class Api::CommentsController < ApplicationController
  include RestApiController
  def permited_params
    %i[text_content is_answer session_hash employee_id question_id]
  end

  def create_callback
    @resource.employee = @current_user unless params[:is_anonymous].nill? || params[:is_anonymous]
  end
end
