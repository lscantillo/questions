class Api::TagsController < ApplicationController
  include RestApiController

  @permited_params = %i[name]
end
