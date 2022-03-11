class Api::QuestionsController < ApplicationController
  include Pagy::Backend
  include RestApiController
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def permited_params
    %i[employee_id assigned_to_employee_id department_id location_id is_anonymous header text_content]
  end

  def index_callback
    @instance_options['layout'] = @params['layout'] if @params&.key? :layout
    @pagy, @questions = pagy(Question.all.order('created_at DESC'))
    { data: serialize(@questions, QuestionSerializer), pagy: pagy_metadata(@pagy) }
  end

  def show_callback
    @resource = {
      data: ActiveModelSerializers::SerializableResource.new(
        @resource,
        serializer: DetailedQuestionSerializer
      )
    }
  end
end
