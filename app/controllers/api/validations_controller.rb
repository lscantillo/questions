class Api::ValidationsController < ApplicationController
  before_action :search_params
  include Pagy::Backend

  def similar_questions
    @results = Question.search(@params[:content])
    @pagy, @records = pagy(@results)
    render json: { data: @records,
                       pagy: pagy_metadata(@pagy) }
  end

  private

  def search_params
     @params = params.require(:search).permit(:content)
  end

end
