class Api::EmployeesController < ApplicationController
  include RestApiController

  def permited_params
    %i[full_name email is_admin job_title profile_picture_url department_id]
  end

  def admins
    @admins = Employee.where(is_admin: true)
    @serializer ||= "#{resource_class}Serializer".constantize
    if params[:items].nil?
      render json: { data: serialize(@admins, @serializer)[resource_class.to_s.downcase.pluralize.to_sym] }, status: :ok
    else
      params[:items] ||= Pagy::DEFAULT[:items]
      @pagy, @admins = pagy(@admins, items: params[:items])
      render json: { data: serialize(@admins, @serializer)[resource_class.to_s.downcase.pluralize.to_sym], pagy: pagy_metadata(@pagy) },
             status: :ok
    end
  end
end
