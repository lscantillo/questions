class Api::QuestionsController < ApplicationController
  include Pagy::Backend
  include RestApiController

  after_action { pagy_headers_merge(@pagy) if @pagy }
  @permited_params = %i[employee_id assigned_to_employee_id department_id location_id is_anonymous header text_content]

  def index
    @pagy, @questions = pagy(Question.all.order('created_at DESC'))
    render json: { data: @questions, pagy: pagy_metadata(@pagy) }
  end
  
end
