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
      @pagy, @records = pagy(@results, items: params[:items])
      render json: { data: @records,
                     pagy: pagy_metadata(@pagy) }
    end
  end

  private

  def search_params
    @params = params.require(:search).permit(:content)
  end
end
