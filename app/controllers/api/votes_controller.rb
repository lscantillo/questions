class Api::VotesController < ApplicationController
  include RestApiControllers

  def permited_params
    %i[is_up_vote question_id employee_id]
  end
end
