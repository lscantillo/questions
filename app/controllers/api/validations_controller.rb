class Api::ValidationsController < ApplicationController
  before_action :search_params, only: %i[similar_questions]
  include Pagy::Backend

  def similar_questions
    @results = Question.search(@params[:content])
    @pagy, @records = pagy(@results)
    render json: { data: @records,
                       pagy: pagy_metadata(@pagy) }
  end

  def hottest
    @questions = Question.hottest
    @pagy, @records = pagy(@questions[0])
    render json: { data: @records,
                   pagy: pagy_metadata(@pagy) }
  end

  def interesting
    @questions = Question.insteresting
    @pagy, @records = pagy(@questions[0])
    render json: { data: @records,
                   pagy: pagy_metadata(@pagy) }
  end


  private
  def search_params
     @params = params.require(:search).permit(:content)
  end

end
