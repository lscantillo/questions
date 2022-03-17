class Api::VotesController < ApplicationController
  include RestApiController

  def permited_params
    %i[is_up_vote question_id employee_id]
  end
end
