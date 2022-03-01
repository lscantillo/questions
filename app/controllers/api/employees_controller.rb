class Api::EmployeesController < ApplicationController
  include RestApiController
  def admins
    @admins = Employee.where(is_admin: true)
    render json: @admins
  end
  @permited_params = %i[full_name email is_admin profile_picture_url department_id]
end
