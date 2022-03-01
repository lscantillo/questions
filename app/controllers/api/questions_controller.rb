
class Api::QuestionsController < ApplicationController
  include RestApiController

  @permited_params = %i[header text_content employee_id user_hash employee_id assigned_to_employee_id location ]
end
