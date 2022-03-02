class Api::LocationsController < ApplicationController
  include RestApiController

  @permited_params = %i[name code]
end
