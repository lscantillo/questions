class Api::ValidationsController < ApplicationController
  before_action :search_params, only: %i[similar_questions]
  include Pagy::Backend

  def similar_questions
    @results = Question.search(@params[:content])
    if params[:items].nil? && params[:page].nil?
      render json: {data: @results},status: :ok
    else
      params[:items] ||= Pagy::DEFAULT[:items]
      params[:page] ||= Pagy::DEFAULT[:page]
      @pagy, @records = pagy_array(@results, items: params[:items])
      render json: { data: @records,
                     pagy: pagy_metadata(@pagy) }
    end
  end

  def hottest
    @questions = Question.hottest
    if params[:items].nil? && params[:page].nil?
      render json: {data: @questions[0]},status: :ok
    else
      params[:items] ||= Pagy::DEFAULT[:items]
      params[:page] ||= Pagy::DEFAULT[:page]
      @pagy, @records = pagy_array(@questions[0], items: params[:items])
      render json: { data: @records,
                     pagy: pagy_metadata(@pagy) }
    end
  end

  def interesting
    @questions = Question.insteresting
    if params[:items].nil? && params[:page].nil?
      render json: {data: @questions[0]},status: :ok
    else
      params[:items] ||= Pagy::DEFAULT[:items]
      params[:page] ||= Pagy::DEFAULT[:page]
      @pagy, @records = pagy_array(@questions[0], items: params[:items])
      render json: { data: @records,
                     pagy: pagy_metadata(@pagy) }
    end
  end


  private
  def search_params
     @params = params.require(:search).permit(:content)
  end

end
