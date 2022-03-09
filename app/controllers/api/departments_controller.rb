class Api::DepartmentsController < ApplicationController
  include RestApiController
  def permited_params
    %i[name is_active abbreviation]
  end
end
