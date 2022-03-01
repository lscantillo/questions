class Api::QuestionsController < ApplicationController
  include Pagy::Backend
  include RestApiController
  after_action { pagy_headers_merge(@pagy) if @pagy }
  @permited_params = %i[header text_content]

  def index
    @pagy, @questions = pagy(Question.all)
    render json: { data: @questions, pagy: pagy_metadata(@pagy) }
  end
  
end
