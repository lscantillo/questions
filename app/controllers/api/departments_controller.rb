class Api::DepartmentsController < ApplicationController
  include RestApiController
  @permited_params = %i[name is_active abbreviation]
end
