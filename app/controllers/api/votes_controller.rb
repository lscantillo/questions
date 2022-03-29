class Api::VotesController < ApplicationController
  include RestApiController

  def add_vote
    vote_params = {
      user_token_id: @sub,
      question_id: params['question_id'],
      is_up_vote: params['is_up_vote']
    }
    @vote = Vote.create(vote_params)
    if @vote.saved_changes?
      render :json, status: :ok
    else
      render :json, status: :conflict
    end
  end

  def remove_vote
    @vote = Vote.find_by(question_id: params['question_id'],user_token_id: @sub )
    @vote.destroy
    if @vote.destroyed?
      render :json, status: :ok
    else
      render :json, status: :internal_server_error
    end
  end
  def permited_params
    %i[is_up_vote question_id employee_id :user_token_id]
  end
end
