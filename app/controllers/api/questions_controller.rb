
class Api::QuestionsController < ApplicationController
  include RestApiController

  @permited_params = %i[header text_content]
end
