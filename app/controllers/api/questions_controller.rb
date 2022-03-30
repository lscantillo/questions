class Api::QuestionsController < ApplicationController
  include Pagy::Backend
  include RestApiController
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def permited_params
    %i[employee_id assigned_to_employee_id department_id location_id is_anonymous header text_content tags]
  end

  def index_callback
    @serializer = MinimalQuestionSerializer unless params[:layout].nil? || params[:layout] != 'minimal'
    @sort = params[:sort]
    @resources = @sort.nil? ? Question.all.order('created_at DESC') : Question.public_send(@sort)
  end

  def show_callback
    @serializer = DetailedQuestionSerializer
  end

  def create_callback
    @resource.tags = Tag.Tagization(params[:question][:tags]) unless params[:question][:tags].nil?
  end

  def update_callback
    @resource.tags = Tag.Tagization(params[:question][:tags]) unless params[:question][:tags].nil?
  end
end
