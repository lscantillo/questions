# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header

    begin
      raise Api::EmptyHeader.new(401) if header.nil?
      @decoded = JsonWebToken::Encoder.decode(header)
      raise JWT::ExpiredError, header if (Time.now <=> Time.at(@decoded['exp'])) == 1
      employee_params = {
        full_name: @decoded['name'],
        email: @decoded['email'],
        is_admin: false,
        profile_picture_url: @decoded['picture']
      }
      @current_user = Employee.find_or_create_by(employee_params)
    rescue Api::EmptyHeader => e
      render json: { code: e.code, error: e.message }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue JWT::DecodeError => e
      render json: { error: "Could not decode authetication token", status_code: 401}, status: :unauthorized
    rescue JWT::ExpiredError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end


end
