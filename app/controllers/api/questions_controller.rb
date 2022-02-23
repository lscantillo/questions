class QuestionsController < ApplicationController
  before_action :authorize_request
  before_action :get_user, exept: %i[index create]
  def index
    
  end

  def show
    
  end

  def get_user
    begin
      user = User.find_by_id(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render :json {:error e.message}
    end
  end
end
