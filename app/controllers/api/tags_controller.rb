class Api::TagsController < ApplicationController
  include RestApiController

  def permited_params
    %i[name]
  end
end
