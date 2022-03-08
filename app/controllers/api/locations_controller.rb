class Api::LocationsController < ApplicationController
  include RestApiController

  def permited_params
    %i[name code]
  end
end
